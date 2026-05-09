; DESCRIPTION: Renders a orange line between points (2, 68) and (375, 230).
; PLAN: r0=2(x1), r1=68(y1), r2=375(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 68
LDI r2, 375
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
