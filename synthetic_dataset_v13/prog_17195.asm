; DESCRIPTION: Renders a white line between points (88, 174) and (73, 227).
; PLAN: r0=88(x1), r1=174(y1), r2=73(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 174
LDI r2, 73
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
