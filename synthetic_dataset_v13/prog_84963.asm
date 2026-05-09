; DESCRIPTION: Renders a orange line between points (219, 78) and (156, 204).
; PLAN: r0=219(x1), r1=78(y1), r2=156(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 78
LDI r2, 156
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
