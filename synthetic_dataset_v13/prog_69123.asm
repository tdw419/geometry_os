; DESCRIPTION: Renders a orange line between points (134, 43) and (426, 103).
; PLAN: r0=134(x1), r1=43(y1), r2=426(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 43
LDI r2, 426
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
