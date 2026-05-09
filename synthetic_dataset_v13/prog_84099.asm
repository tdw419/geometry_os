; DESCRIPTION: Composite: Places a blue dot at position (502, 149) then Draws a magenta circle centered at (238, 188) with radius 49 then Draws a green rectangle at (373, 203) with width 117 and height 24.
; PLAN: r0=502(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=188(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=203(y), r12=117(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 188
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 203
LDI r12, 117
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
