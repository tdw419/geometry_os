; DESCRIPTION: Renders a yellow line between points (472, 176) and (22, 73).
; PLAN: r0=472(x1), r1=176(y1), r2=22(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 176
LDI r2, 22
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
