; DESCRIPTION: Places a purple line segment connecting (411, 193) to (238, 251).
; PLAN: r0=411(x1), r1=193(y1), r2=238(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 193
LDI r2, 238
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
