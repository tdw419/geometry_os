; DESCRIPTION: Renders a green line between points (351, 104) and (92, 180).
; PLAN: r0=351(x1), r1=104(y1), r2=92(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 104
LDI r2, 92
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
