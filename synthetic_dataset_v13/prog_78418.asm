; DESCRIPTION: Renders a white line between points (291, 11) and (249, 129).
; PLAN: r0=291(x1), r1=11(y1), r2=249(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 11
LDI r2, 249
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
