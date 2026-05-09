; DESCRIPTION: Renders a magenta line between points (15, 124) and (85, 41).
; PLAN: r0=15(x1), r1=124(y1), r2=85(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 124
LDI r2, 85
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
