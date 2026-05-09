; DESCRIPTION: Renders a yellow line between points (448, 95) and (151, 232).
; PLAN: r0=448(x1), r1=95(y1), r2=151(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 95
LDI r2, 151
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
