; DESCRIPTION: Renders a blue line between points (253, 252) and (42, 145).
; PLAN: r0=253(x1), r1=252(y1), r2=42(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 252
LDI r2, 42
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
