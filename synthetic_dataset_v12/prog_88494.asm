; DESCRIPTION: Renders a yellow line between points (373, 62) and (97, 85).
; PLAN: r0=373(x1), r1=62(y1), r2=97(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 62
LDI r2, 97
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
