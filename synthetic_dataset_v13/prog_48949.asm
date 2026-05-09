; DESCRIPTION: Renders a orange line between points (341, 72) and (311, 199).
; PLAN: r0=341(x1), r1=72(y1), r2=311(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 72
LDI r2, 311
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
