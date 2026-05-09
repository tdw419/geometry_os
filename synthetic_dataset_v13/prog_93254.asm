; DESCRIPTION: Renders a blue line between points (419, 117) and (423, 141).
; PLAN: r0=419(x1), r1=117(y1), r2=423(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 117
LDI r2, 423
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
