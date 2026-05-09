; DESCRIPTION: Places a yellow line segment connecting (419, 115) to (352, 67).
; PLAN: r0=419(x1), r1=115(y1), r2=352(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 115
LDI r2, 352
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
