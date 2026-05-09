; DESCRIPTION: Places a purple line segment connecting (366, 184) to (26, 171).
; PLAN: r0=366(x1), r1=184(y1), r2=26(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 184
LDI r2, 26
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
