; DESCRIPTION: Renders a purple line between points (308, 100) and (433, 41).
; PLAN: r0=308(x1), r1=100(y1), r2=433(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 100
LDI r2, 433
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
