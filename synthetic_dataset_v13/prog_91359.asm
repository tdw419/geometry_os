; DESCRIPTION: Places a black line segment connecting (94, 25) to (490, 173).
; PLAN: r0=94(x1), r1=25(y1), r2=490(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 25
LDI r2, 490
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
