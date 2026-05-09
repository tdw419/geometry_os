; DESCRIPTION: Renders a blue line between points (379, 5) and (58, 105).
; PLAN: r0=379(x1), r1=5(y1), r2=58(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 5
LDI r2, 58
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
