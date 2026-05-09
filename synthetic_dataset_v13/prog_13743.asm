; DESCRIPTION: Renders a blue line between points (402, 0) and (68, 70).
; PLAN: r0=402(x1), r1=0(y1), r2=68(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 0
LDI r2, 68
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
