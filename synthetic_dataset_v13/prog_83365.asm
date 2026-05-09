; DESCRIPTION: Renders a yellow line between points (476, 212) and (105, 2).
; PLAN: r0=476(x1), r1=212(y1), r2=105(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 212
LDI r2, 105
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
