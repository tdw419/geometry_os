; DESCRIPTION: Renders a orange line between points (476, 2) and (141, 115).
; PLAN: r0=476(x1), r1=2(y1), r2=141(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 2
LDI r2, 141
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
