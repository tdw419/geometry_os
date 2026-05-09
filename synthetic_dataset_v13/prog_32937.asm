; DESCRIPTION: Renders a orange line between points (225, 156) and (402, 120).
; PLAN: r0=225(x1), r1=156(y1), r2=402(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 156
LDI r2, 402
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
