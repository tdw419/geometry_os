; DESCRIPTION: Renders a white line between points (201, 57) and (223, 88).
; PLAN: r0=201(x1), r1=57(y1), r2=223(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 57
LDI r2, 223
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
