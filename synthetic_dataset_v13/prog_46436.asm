; DESCRIPTION: Renders a blue line between points (436, 58) and (341, 248).
; PLAN: r0=436(x1), r1=58(y1), r2=341(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 58
LDI r2, 341
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
