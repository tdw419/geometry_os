; DESCRIPTION: Composite: Draws a orange line from (132, 116) to (75, 132) then Sets a single red pixel at (211, 20) then Renders a yellow disk with center (254, 155) and radius 46.
; PLAN: r0=132(x1), r1=116(y1), r2=75(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=20(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=155(y), r12=46(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 116
LDI r2, 75
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 20
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 254
LDI r11, 155
LDI r12, 46
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
