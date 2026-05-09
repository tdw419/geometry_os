; DESCRIPTION: Composite: Draws a green rectangle at (43, 150) with width 52 and height 25 then Sets a single blue pixel at (19, 89) then Creates a yellow circular shape at (169, 156) with radius 73.
; PLAN: r0=43(x), r1=150(y), r2=52(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=89(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=156(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 150
LDI r2, 52
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 89
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 169
LDI r11, 156
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
