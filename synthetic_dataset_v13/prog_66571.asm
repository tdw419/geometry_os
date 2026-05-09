; DESCRIPTION: Composite: Sets a single blue pixel at (120, 146) then Draws a orange line from (100, 200) to (328, 23) then Renders a black disk with center (287, 87) and radius 62.
; PLAN: r0=120(x), r1=146(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=200(y1), r7=328(x2), r8=23(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=87(y), r12=62(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 146
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 200
LDI r7, 328
LDI r8, 23
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 87
LDI r12, 62
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
