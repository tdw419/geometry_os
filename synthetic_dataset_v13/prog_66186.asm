; DESCRIPTION: Renders a white line between points (19, 225) and (169, 145).
; PLAN: r0=19(x1), r1=225(y1), r2=169(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 225
LDI r2, 169
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
