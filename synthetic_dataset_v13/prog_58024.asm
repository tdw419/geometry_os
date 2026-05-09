; DESCRIPTION: Renders a black line between points (476, 205) and (264, 158).
; PLAN: r0=476(x1), r1=205(y1), r2=264(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 205
LDI r2, 264
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
