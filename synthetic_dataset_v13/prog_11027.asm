; DESCRIPTION: Renders a orange line between points (125, 55) and (211, 126).
; PLAN: r0=125(x1), r1=55(y1), r2=211(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 55
LDI r2, 211
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
