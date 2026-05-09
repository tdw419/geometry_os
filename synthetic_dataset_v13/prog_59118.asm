; DESCRIPTION: Renders a white line between points (331, 169) and (200, 17).
; PLAN: r0=331(x1), r1=169(y1), r2=200(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 169
LDI r2, 200
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
