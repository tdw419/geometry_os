; DESCRIPTION: Renders a blue line between points (103, 109) and (466, 145).
; PLAN: r0=103(x1), r1=109(y1), r2=466(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 109
LDI r2, 466
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
