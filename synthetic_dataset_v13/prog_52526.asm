; DESCRIPTION: Renders a black line between points (256, 156) and (24, 148).
; PLAN: r0=256(x1), r1=156(y1), r2=24(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 156
LDI r2, 24
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
