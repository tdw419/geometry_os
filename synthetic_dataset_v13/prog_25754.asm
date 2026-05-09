; DESCRIPTION: Renders a yellow line between points (325, 105) and (89, 221).
; PLAN: r0=325(x1), r1=105(y1), r2=89(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 105
LDI r2, 89
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
