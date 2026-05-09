; DESCRIPTION: Renders a orange line between points (99, 199) and (494, 60).
; PLAN: r0=99(x1), r1=199(y1), r2=494(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 199
LDI r2, 494
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
