; DESCRIPTION: Renders a orange line between points (496, 202) and (304, 96).
; PLAN: r0=496(x1), r1=202(y1), r2=304(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 202
LDI r2, 304
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
