; DESCRIPTION: Places a blue line segment connecting (381, 226) to (104, 1).
; PLAN: r0=381(x1), r1=226(y1), r2=104(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 226
LDI r2, 104
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
