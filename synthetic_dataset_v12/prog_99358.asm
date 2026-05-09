; DESCRIPTION: Renders a magenta line between points (474, 211) and (314, 153).
; PLAN: r0=474(x1), r1=211(y1), r2=314(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 211
LDI r2, 314
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
