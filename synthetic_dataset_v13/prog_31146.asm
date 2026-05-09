; DESCRIPTION: Draws a purple line from (89, 50) to (78, 237).
; PLAN: r0=89(x1), r1=50(y1), r2=78(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 50
LDI r2, 78
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
