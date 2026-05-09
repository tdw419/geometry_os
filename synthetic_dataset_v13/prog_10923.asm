; DESCRIPTION: Renders a orange line between points (65, 252) and (251, 175).
; PLAN: r0=65(x1), r1=252(y1), r2=251(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 252
LDI r2, 251
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
