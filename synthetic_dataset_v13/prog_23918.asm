; DESCRIPTION: Renders a orange line between points (134, 224) and (61, 232).
; PLAN: r0=134(x1), r1=224(y1), r2=61(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 224
LDI r2, 61
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
