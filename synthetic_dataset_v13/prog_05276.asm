; DESCRIPTION: Renders a black line between points (156, 88) and (457, 0).
; PLAN: r0=156(x1), r1=88(y1), r2=457(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 88
LDI r2, 457
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
