; DESCRIPTION: Renders a yellow line between points (338, 131) and (506, 183).
; PLAN: r0=338(x1), r1=131(y1), r2=506(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 131
LDI r2, 506
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
