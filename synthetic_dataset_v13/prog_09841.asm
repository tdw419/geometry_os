; DESCRIPTION: Renders a blue line between points (436, 33) and (129, 100).
; PLAN: r0=436(x1), r1=33(y1), r2=129(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 33
LDI r2, 129
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
