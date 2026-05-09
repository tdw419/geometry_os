; DESCRIPTION: Renders a green line between points (476, 96) and (424, 4).
; PLAN: r0=476(x1), r1=96(y1), r2=424(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 96
LDI r2, 424
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
