; DESCRIPTION: Renders a green line between points (314, 169) and (199, 125).
; PLAN: r0=314(x1), r1=169(y1), r2=199(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 169
LDI r2, 199
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
