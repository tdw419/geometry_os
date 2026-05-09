; DESCRIPTION: Renders a yellow line between points (306, 252) and (451, 205).
; PLAN: r0=306(x1), r1=252(y1), r2=451(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 252
LDI r2, 451
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
