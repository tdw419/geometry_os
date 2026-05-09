; DESCRIPTION: Renders a orange line between points (178, 115) and (353, 109).
; PLAN: r0=178(x1), r1=115(y1), r2=353(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 115
LDI r2, 353
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
