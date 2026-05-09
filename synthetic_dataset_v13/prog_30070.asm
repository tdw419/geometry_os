; DESCRIPTION: Renders a orange line between points (309, 11) and (506, 250).
; PLAN: r0=309(x1), r1=11(y1), r2=506(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 11
LDI r2, 506
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
