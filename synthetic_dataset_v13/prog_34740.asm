; DESCRIPTION: Renders a yellow line between points (392, 105) and (476, 11).
; PLAN: r0=392(x1), r1=105(y1), r2=476(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 105
LDI r2, 476
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
