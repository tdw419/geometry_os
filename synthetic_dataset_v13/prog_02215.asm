; DESCRIPTION: Renders a yellow line between points (37, 88) and (297, 64).
; PLAN: r0=37(x1), r1=88(y1), r2=297(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 88
LDI r2, 297
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
