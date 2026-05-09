; DESCRIPTION: Renders a yellow line between points (426, 81) and (211, 163).
; PLAN: r0=426(x1), r1=81(y1), r2=211(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 81
LDI r2, 211
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
