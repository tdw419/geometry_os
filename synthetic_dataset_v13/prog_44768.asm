; DESCRIPTION: Places a blue line segment connecting (378, 73) to (402, 8).
; PLAN: r0=378(x1), r1=73(y1), r2=402(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 73
LDI r2, 402
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
