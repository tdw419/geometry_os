; DESCRIPTION: Renders a red line between points (134, 65) and (357, 205).
; PLAN: r0=134(x1), r1=65(y1), r2=357(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 65
LDI r2, 357
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
