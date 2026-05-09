; DESCRIPTION: Renders a blue line between points (46, 185) and (341, 218).
; PLAN: r0=46(x1), r1=185(y1), r2=341(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 185
LDI r2, 341
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
