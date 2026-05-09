; DESCRIPTION: Places a blue line segment connecting (119, 15) to (361, 81).
; PLAN: r0=119(x1), r1=15(y1), r2=361(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 15
LDI r2, 361
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
