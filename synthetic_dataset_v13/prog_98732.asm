; DESCRIPTION: Draws a orange line from (414, 129) to (192, 102).
; PLAN: r0=414(x1), r1=129(y1), r2=192(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 129
LDI r2, 192
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
