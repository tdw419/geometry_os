; DESCRIPTION: Places a black line segment connecting (364, 199) to (481, 97).
; PLAN: r0=364(x1), r1=199(y1), r2=481(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 199
LDI r2, 481
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
