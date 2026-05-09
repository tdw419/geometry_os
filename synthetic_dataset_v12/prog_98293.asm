; DESCRIPTION: Renders a orange line between points (375, 78) and (121, 74).
; PLAN: r0=375(x1), r1=78(y1), r2=121(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 78
LDI r2, 121
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
