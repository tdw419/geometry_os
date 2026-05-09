; DESCRIPTION: Renders a orange line between points (414, 151) and (194, 239).
; PLAN: r0=414(x1), r1=151(y1), r2=194(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 151
LDI r2, 194
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
