; DESCRIPTION: Renders a blue line between points (446, 87) and (453, 35).
; PLAN: r0=446(x1), r1=87(y1), r2=453(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 87
LDI r2, 453
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
