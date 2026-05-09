; DESCRIPTION: Renders a purple line between points (402, 12) and (483, 29).
; PLAN: r0=402(x1), r1=12(y1), r2=483(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 12
LDI r2, 483
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
