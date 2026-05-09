; DESCRIPTION: Renders a blue line between points (314, 203) and (506, 242).
; PLAN: r0=314(x1), r1=203(y1), r2=506(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 203
LDI r2, 506
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
