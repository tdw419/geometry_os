; DESCRIPTION: Places a purple line segment connecting (339, 221) to (471, 226).
; PLAN: r0=339(x1), r1=221(y1), r2=471(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 221
LDI r2, 471
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
