; DESCRIPTION: Renders a white line between points (357, 26) and (148, 145).
; PLAN: r0=357(x1), r1=26(y1), r2=148(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 26
LDI r2, 148
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
