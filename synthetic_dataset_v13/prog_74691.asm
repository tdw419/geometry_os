; DESCRIPTION: Renders a orange line between points (151, 23) and (233, 66).
; PLAN: r0=151(x1), r1=23(y1), r2=233(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 23
LDI r2, 233
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
