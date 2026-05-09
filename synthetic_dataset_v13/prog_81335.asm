; DESCRIPTION: Renders a blue line between points (273, 24) and (246, 211).
; PLAN: r0=273(x1), r1=24(y1), r2=246(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 24
LDI r2, 246
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
