; DESCRIPTION: Renders a blue line between points (41, 33) and (85, 68).
; PLAN: r0=41(x1), r1=33(y1), r2=85(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 33
LDI r2, 85
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
