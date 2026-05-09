; DESCRIPTION: Places a blue line segment connecting (252, 97) to (381, 74).
; PLAN: r0=252(x1), r1=97(y1), r2=381(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 97
LDI r2, 381
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
