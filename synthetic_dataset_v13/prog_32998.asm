; DESCRIPTION: Renders a yellow line between points (237, 144) and (61, 11).
; PLAN: r0=237(x1), r1=144(y1), r2=61(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 144
LDI r2, 61
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
