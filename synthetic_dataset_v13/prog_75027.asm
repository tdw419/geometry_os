; DESCRIPTION: Renders a blue line between points (443, 248) and (496, 11).
; PLAN: r0=443(x1), r1=248(y1), r2=496(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 248
LDI r2, 496
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
