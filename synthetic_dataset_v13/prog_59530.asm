; DESCRIPTION: Renders a blue line between points (396, 144) and (419, 35).
; PLAN: r0=396(x1), r1=144(y1), r2=419(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 144
LDI r2, 419
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
