; DESCRIPTION: Composite: Places a blue dot at position (500, 59) then Draws a green circle centered at (297, 89) with radius 39 then Creates a magenta rectangular region at (220, 84) spanning 74 by 47 pixels.
; PLAN: r0=500(x), r1=59(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=89(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x), r11=84(y), r12=74(width), r13=47(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 59
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 89
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 84
LDI r12, 74
LDI r13, 47
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
