; DESCRIPTION: Composite: Places a green dot at position (37, 172) then Renders a black disk with center (229, 81) and radius 56 then Draws a purple rectangle at (259, 199) with width 91 and height 11.
; PLAN: r0=37(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=81(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x), r11=199(y), r12=91(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 81
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 199
LDI r12, 91
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
