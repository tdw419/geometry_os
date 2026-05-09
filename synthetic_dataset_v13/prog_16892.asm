; DESCRIPTION: Renders a white line between points (357, 11) and (161, 15).
; PLAN: r0=357(x1), r1=11(y1), r2=161(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 11
LDI r2, 161
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
