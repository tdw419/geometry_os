; DESCRIPTION: Composite: Places a white dot at position (233, 217) then Renders a magenta disk with center (287, 96) and radius 17 then Draws a green rectangle at (28, 80) with width 83 and height 78.
; PLAN: r0=233(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=96(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=80(y), r12=83(width), r13=78(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 96
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 80
LDI r12, 83
LDI r13, 78
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
