; DESCRIPTION: Renders a orange line between points (376, 43) and (152, 50).
; PLAN: r0=376(x1), r1=43(y1), r2=152(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 43
LDI r2, 152
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
