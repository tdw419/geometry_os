; DESCRIPTION: Renders a blue line between points (417, 99) and (85, 157).
; PLAN: r0=417(x1), r1=99(y1), r2=85(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 99
LDI r2, 85
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
