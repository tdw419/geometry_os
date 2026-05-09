; DESCRIPTION: Renders a blue line between points (376, 14) and (33, 225).
; PLAN: r0=376(x1), r1=14(y1), r2=33(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 14
LDI r2, 33
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
