; DESCRIPTION: Renders a red line between points (289, 98) and (496, 123).
; PLAN: r0=289(x1), r1=98(y1), r2=496(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 98
LDI r2, 496
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
