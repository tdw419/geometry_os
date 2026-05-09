; DESCRIPTION: Renders a orange line between points (26, 157) and (170, 72).
; PLAN: r0=26(x1), r1=157(y1), r2=170(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 157
LDI r2, 170
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
