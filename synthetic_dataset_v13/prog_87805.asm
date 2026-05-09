; DESCRIPTION: Places a purple line segment connecting (361, 8) to (442, 233).
; PLAN: r0=361(x1), r1=8(y1), r2=442(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 8
LDI r2, 442
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
