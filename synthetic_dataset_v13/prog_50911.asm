; DESCRIPTION: Renders a orange line between points (192, 233) and (78, 156).
; PLAN: r0=192(x1), r1=233(y1), r2=78(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 233
LDI r2, 78
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
