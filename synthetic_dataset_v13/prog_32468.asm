; DESCRIPTION: Renders a orange line between points (233, 114) and (272, 76).
; PLAN: r0=233(x1), r1=114(y1), r2=272(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 114
LDI r2, 272
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
