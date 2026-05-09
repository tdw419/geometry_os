; DESCRIPTION: Renders a yellow line between points (151, 24) and (24, 219).
; PLAN: r0=151(x1), r1=24(y1), r2=24(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 24
LDI r2, 24
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
