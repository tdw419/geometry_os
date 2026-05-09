; DESCRIPTION: Renders a white line between points (15, 89) and (337, 88).
; PLAN: r0=15(x1), r1=89(y1), r2=337(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 89
LDI r2, 337
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
