; DESCRIPTION: Renders a orange line between points (402, 158) and (299, 16).
; PLAN: r0=402(x1), r1=158(y1), r2=299(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 158
LDI r2, 299
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
