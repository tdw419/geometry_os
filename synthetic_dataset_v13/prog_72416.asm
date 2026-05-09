; DESCRIPTION: Renders a orange line between points (493, 17) and (351, 131).
; PLAN: r0=493(x1), r1=17(y1), r2=351(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 17
LDI r2, 351
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
