; DESCRIPTION: Places a black line segment connecting (177, 139) to (451, 224).
; PLAN: r0=177(x1), r1=139(y1), r2=451(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 139
LDI r2, 451
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
