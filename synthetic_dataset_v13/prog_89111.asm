; DESCRIPTION: Places a black line segment connecting (80, 64) to (490, 19).
; PLAN: r0=80(x1), r1=64(y1), r2=490(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 64
LDI r2, 490
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
