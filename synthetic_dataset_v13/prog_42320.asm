; DESCRIPTION: Renders a green line between points (355, 149) and (402, 119).
; PLAN: r0=355(x1), r1=149(y1), r2=402(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 149
LDI r2, 402
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
