; DESCRIPTION: Renders a magenta line between points (506, 238) and (474, 136).
; PLAN: r0=506(x1), r1=238(y1), r2=474(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 238
LDI r2, 474
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
