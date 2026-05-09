; DESCRIPTION: Renders a orange line between points (211, 169) and (329, 30).
; PLAN: r0=211(x1), r1=169(y1), r2=329(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 169
LDI r2, 329
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
