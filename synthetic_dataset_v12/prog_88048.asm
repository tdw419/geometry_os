; DESCRIPTION: Renders a blue line between points (205, 250) and (53, 88).
; PLAN: r0=205(x1), r1=250(y1), r2=53(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 250
LDI r2, 53
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
