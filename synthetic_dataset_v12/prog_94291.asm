; DESCRIPTION: Places a purple line segment connecting (219, 30) to (440, 31).
; PLAN: r0=219(x1), r1=30(y1), r2=440(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 30
LDI r2, 440
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
