; DESCRIPTION: Renders a orange line between points (397, 43) and (137, 156).
; PLAN: r0=397(x1), r1=43(y1), r2=137(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 43
LDI r2, 137
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
