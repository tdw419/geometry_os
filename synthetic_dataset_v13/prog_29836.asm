; DESCRIPTION: Places a purple line segment connecting (130, 73) to (262, 238).
; PLAN: r0=130(x1), r1=73(y1), r2=262(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 73
LDI r2, 262
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
