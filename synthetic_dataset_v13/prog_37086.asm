; DESCRIPTION: Renders a orange line between points (178, 81) and (75, 71).
; PLAN: r0=178(x1), r1=81(y1), r2=75(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 81
LDI r2, 75
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
