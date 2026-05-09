; DESCRIPTION: Renders a orange line between points (427, 184) and (458, 255).
; PLAN: r0=427(x1), r1=184(y1), r2=458(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 184
LDI r2, 458
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
