; DESCRIPTION: Renders a white line between points (457, 232) and (36, 34).
; PLAN: r0=457(x1), r1=232(y1), r2=36(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 232
LDI r2, 36
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
