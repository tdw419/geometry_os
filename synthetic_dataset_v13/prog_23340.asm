; DESCRIPTION: Renders a blue line between points (34, 76) and (417, 36).
; PLAN: r0=34(x1), r1=76(y1), r2=417(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 76
LDI r2, 417
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
