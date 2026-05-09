; DESCRIPTION: Renders a blue line between points (496, 211) and (403, 77).
; PLAN: r0=496(x1), r1=211(y1), r2=403(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 211
LDI r2, 403
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
