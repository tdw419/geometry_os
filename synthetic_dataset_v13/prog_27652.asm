; DESCRIPTION: Composite: Draws a black rectangle at (194, 136) with width 80 and height 54 then Sets a single cyan pixel at (11, 192) then Creates a green circular shape at (96, 155) with radius 29.
; PLAN: r0=194(x), r1=136(y), r2=80(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=192(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=155(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 136
LDI r2, 80
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 192
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 155
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
