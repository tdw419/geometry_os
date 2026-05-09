; DESCRIPTION: Renders a white line between points (129, 137) and (299, 88).
; PLAN: r0=129(x1), r1=137(y1), r2=299(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 137
LDI r2, 299
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
