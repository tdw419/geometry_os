; DESCRIPTION: Renders a orange line between points (122, 106) and (332, 208).
; PLAN: r0=122(x1), r1=106(y1), r2=332(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 106
LDI r2, 332
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
