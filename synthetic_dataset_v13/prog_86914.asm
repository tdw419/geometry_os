; DESCRIPTION: Renders a orange line between points (144, 154) and (339, 211).
; PLAN: r0=144(x1), r1=154(y1), r2=339(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 339
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
