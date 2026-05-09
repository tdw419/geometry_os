; DESCRIPTION: Places a black line segment connecting (364, 77) to (29, 151).
; PLAN: r0=364(x1), r1=77(y1), r2=29(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 77
LDI r2, 29
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
