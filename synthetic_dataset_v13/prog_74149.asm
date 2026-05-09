; DESCRIPTION: Renders a purple line between points (402, 206) and (149, 66).
; PLAN: r0=402(x1), r1=206(y1), r2=149(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 206
LDI r2, 149
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
