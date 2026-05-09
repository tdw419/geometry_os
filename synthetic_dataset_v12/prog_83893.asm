; DESCRIPTION: Renders a orange line between points (442, 11) and (335, 69).
; PLAN: r0=442(x1), r1=11(y1), r2=335(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 11
LDI r2, 335
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
