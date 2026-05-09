; DESCRIPTION: Renders a orange line between points (260, 82) and (381, 10).
; PLAN: r0=260(x1), r1=82(y1), r2=381(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 82
LDI r2, 381
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
