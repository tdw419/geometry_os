; DESCRIPTION: Renders a yellow line between points (476, 63) and (47, 48).
; PLAN: r0=476(x1), r1=63(y1), r2=47(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 63
LDI r2, 47
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
