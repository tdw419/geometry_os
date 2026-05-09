; DESCRIPTION: Composite: Sets a single yellow pixel at (203, 219) then Draws a black rectangle at (36, 127) with width 63 and height 80 then Creates a purple circular shape at (83, 126) with radius 71.
; PLAN: r0=203(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=127(y), r7=63(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=126(y), r12=71(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 127
LDI r7, 63
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 126
LDI r12, 71
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
