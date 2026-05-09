; DESCRIPTION: Composite: Draws a black line from (30, 73) to (273, 89) then Creates a blue circular shape at (350, 166) with radius 62 then Sets a single black pixel at (332, 252).
; PLAN: r0=30(x1), r1=73(y1), r2=273(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=166(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=252(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 73
LDI r2, 273
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 166
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 252
LDI r12, 0x000000
PSET r10, r11, r12
HALT
