; DESCRIPTION: Renders a yellow line between points (287, 80) and (151, 115).
; PLAN: r0=287(x1), r1=80(y1), r2=151(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 80
LDI r2, 151
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
