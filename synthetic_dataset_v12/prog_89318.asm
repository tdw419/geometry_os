; DESCRIPTION: Renders a red line between points (155, 205) and (414, 211).
; PLAN: r0=155(x1), r1=205(y1), r2=414(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 205
LDI r2, 414
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
