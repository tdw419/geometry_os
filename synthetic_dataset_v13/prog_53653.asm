; DESCRIPTION: Renders a green line between points (199, 144) and (418, 109).
; PLAN: r0=199(x1), r1=144(y1), r2=418(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 144
LDI r2, 418
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
