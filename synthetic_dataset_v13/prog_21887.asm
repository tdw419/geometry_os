; DESCRIPTION: Renders a blue line between points (273, 96) and (439, 227).
; PLAN: r0=273(x1), r1=96(y1), r2=439(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 96
LDI r2, 439
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
