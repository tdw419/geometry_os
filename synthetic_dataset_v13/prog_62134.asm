; DESCRIPTION: Renders a orange line between points (95, 43) and (283, 176).
; PLAN: r0=95(x1), r1=43(y1), r2=283(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 43
LDI r2, 283
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
