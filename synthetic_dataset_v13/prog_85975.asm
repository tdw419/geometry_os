; DESCRIPTION: Renders a purple line between points (252, 194) and (262, 119).
; PLAN: r0=252(x1), r1=194(y1), r2=262(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 194
LDI r2, 262
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
