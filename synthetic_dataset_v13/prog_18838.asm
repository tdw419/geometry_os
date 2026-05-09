; DESCRIPTION: Renders a orange line between points (382, 43) and (35, 82).
; PLAN: r0=382(x1), r1=43(y1), r2=35(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 43
LDI r2, 35
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
