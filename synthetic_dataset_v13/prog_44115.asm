; DESCRIPTION: Places a purple line segment connecting (230, 102) to (11, 243).
; PLAN: r0=230(x1), r1=102(y1), r2=11(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 102
LDI r2, 11
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
