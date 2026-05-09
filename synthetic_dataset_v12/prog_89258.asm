; DESCRIPTION: Draws a yellow line from (451, 9) to (83, 245).
; PLAN: r0=451(x1), r1=9(y1), r2=83(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 9
LDI r2, 83
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
