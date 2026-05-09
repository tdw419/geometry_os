; DESCRIPTION: Renders a white line between points (318, 62) and (169, 72).
; PLAN: r0=318(x1), r1=62(y1), r2=169(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 62
LDI r2, 169
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
