; DESCRIPTION: Draws a green line from (281, 248) to (451, 245).
; PLAN: r0=281(x1), r1=248(y1), r2=451(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 248
LDI r2, 451
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
