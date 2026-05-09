; DESCRIPTION: Places a purple line segment connecting (355, 5) to (411, 177).
; PLAN: r0=355(x1), r1=5(y1), r2=411(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 5
LDI r2, 411
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
