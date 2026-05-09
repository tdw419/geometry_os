; DESCRIPTION: Places a black line segment connecting (56, 139) to (266, 75).
; PLAN: r0=56(x1), r1=139(y1), r2=266(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 139
LDI r2, 266
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
