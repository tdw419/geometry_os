; DESCRIPTION: Renders a green line between points (83, 169) and (409, 251).
; PLAN: r0=83(x1), r1=169(y1), r2=409(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 169
LDI r2, 409
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
