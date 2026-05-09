; DESCRIPTION: Places a purple line segment connecting (310, 141) to (311, 140).
; PLAN: r0=310(x1), r1=141(y1), r2=311(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 141
LDI r2, 311
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
