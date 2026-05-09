; DESCRIPTION: Renders a black line between points (476, 23) and (95, 223).
; PLAN: r0=476(x1), r1=23(y1), r2=95(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 23
LDI r2, 95
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
