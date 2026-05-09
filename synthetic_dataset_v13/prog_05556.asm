; DESCRIPTION: Places a yellow line segment connecting (475, 66) to (77, 245).
; PLAN: r0=475(x1), r1=66(y1), r2=77(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 66
LDI r2, 77
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
