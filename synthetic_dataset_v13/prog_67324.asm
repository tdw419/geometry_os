; DESCRIPTION: Places a purple line segment connecting (352, 145) to (507, 67).
; PLAN: r0=352(x1), r1=145(y1), r2=507(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 145
LDI r2, 507
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
