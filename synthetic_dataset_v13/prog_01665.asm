; DESCRIPTION: Renders a orange line between points (414, 151) and (125, 16).
; PLAN: r0=414(x1), r1=151(y1), r2=125(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 151
LDI r2, 125
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
