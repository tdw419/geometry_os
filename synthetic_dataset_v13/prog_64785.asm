; DESCRIPTION: Renders a black line between points (452, 119) and (407, 212).
; PLAN: r0=452(x1), r1=119(y1), r2=407(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 119
LDI r2, 407
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
