; DESCRIPTION: Places a black line segment connecting (101, 45) to (132, 151).
; PLAN: r0=101(x1), r1=45(y1), r2=132(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 45
LDI r2, 132
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
