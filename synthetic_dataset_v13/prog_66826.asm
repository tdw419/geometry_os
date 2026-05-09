; DESCRIPTION: Renders a orange line between points (426, 225) and (414, 75).
; PLAN: r0=426(x1), r1=225(y1), r2=414(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 225
LDI r2, 414
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
