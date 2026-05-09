; DESCRIPTION: Places a purple line segment connecting (121, 176) to (75, 238).
; PLAN: r0=121(x1), r1=176(y1), r2=75(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 176
LDI r2, 75
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
