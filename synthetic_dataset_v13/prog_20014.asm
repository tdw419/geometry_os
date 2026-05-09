; DESCRIPTION: Renders a orange line between points (212, 26) and (506, 21).
; PLAN: r0=212(x1), r1=26(y1), r2=506(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 26
LDI r2, 506
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
