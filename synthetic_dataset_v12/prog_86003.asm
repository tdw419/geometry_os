; DESCRIPTION: Renders a orange line between points (150, 130) and (49, 157).
; PLAN: r0=150(x1), r1=130(y1), r2=49(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 130
LDI r2, 49
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
