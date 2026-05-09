; DESCRIPTION: Renders a purple line between points (366, 30) and (376, 122).
; PLAN: r0=366(x1), r1=30(y1), r2=376(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 30
LDI r2, 376
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
