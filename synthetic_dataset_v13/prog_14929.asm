; DESCRIPTION: Places a black line segment connecting (268, 139) to (192, 97).
; PLAN: r0=268(x1), r1=139(y1), r2=192(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 139
LDI r2, 192
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
