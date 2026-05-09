; DESCRIPTION: Places a black line segment connecting (417, 240) to (490, 34).
; PLAN: r0=417(x1), r1=240(y1), r2=490(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 240
LDI r2, 490
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
