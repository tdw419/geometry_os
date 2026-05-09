; DESCRIPTION: Renders a blue line between points (114, 25) and (439, 211).
; PLAN: r0=114(x1), r1=25(y1), r2=439(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 25
LDI r2, 439
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
