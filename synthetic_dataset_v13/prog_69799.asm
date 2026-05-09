; DESCRIPTION: Renders a blue line between points (32, 77) and (402, 93).
; PLAN: r0=32(x1), r1=77(y1), r2=402(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 77
LDI r2, 402
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
