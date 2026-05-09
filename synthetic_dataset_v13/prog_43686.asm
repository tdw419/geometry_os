; DESCRIPTION: Renders a white line between points (194, 204) and (461, 123).
; PLAN: r0=194(x1), r1=204(y1), r2=461(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 204
LDI r2, 461
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
