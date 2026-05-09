; DESCRIPTION: Renders a green line between points (25, 212) and (62, 185).
; PLAN: r0=25(x1), r1=212(y1), r2=62(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 212
LDI r2, 62
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
