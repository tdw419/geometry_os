; DESCRIPTION: Renders a white line between points (148, 66) and (191, 227).
; PLAN: r0=148(x1), r1=66(y1), r2=191(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 66
LDI r2, 191
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
