; DESCRIPTION: Places a purple line segment connecting (369, 188) to (291, 167).
; PLAN: r0=369(x1), r1=188(y1), r2=291(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 188
LDI r2, 291
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
