; DESCRIPTION: Renders a orange line between points (260, 43) and (223, 14).
; PLAN: r0=260(x1), r1=43(y1), r2=223(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 43
LDI r2, 223
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
