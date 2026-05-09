; DESCRIPTION: Renders a blue line between points (273, 26) and (76, 3).
; PLAN: r0=273(x1), r1=26(y1), r2=76(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 26
LDI r2, 76
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
