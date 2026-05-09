; DESCRIPTION: Places a purple line segment connecting (297, 161) to (306, 216).
; PLAN: r0=297(x1), r1=161(y1), r2=306(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 161
LDI r2, 306
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
