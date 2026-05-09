; DESCRIPTION: Renders a purple line between points (106, 214) and (433, 35).
; PLAN: r0=106(x1), r1=214(y1), r2=433(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 214
LDI r2, 433
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
