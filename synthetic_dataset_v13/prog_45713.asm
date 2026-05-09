; DESCRIPTION: Renders a blue line between points (323, 206) and (323, 80).
; PLAN: r0=323(x1), r1=206(y1), r2=323(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 206
LDI r2, 323
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
