; DESCRIPTION: Renders a blue line between points (351, 75) and (198, 199).
; PLAN: r0=351(x1), r1=75(y1), r2=198(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 75
LDI r2, 198
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
