; DESCRIPTION: Renders a yellow line between points (163, 109) and (412, 126).
; PLAN: r0=163(x1), r1=109(y1), r2=412(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 109
LDI r2, 412
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
