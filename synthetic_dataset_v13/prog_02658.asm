; DESCRIPTION: Renders a red line between points (449, 24) and (476, 31).
; PLAN: r0=449(x1), r1=24(y1), r2=476(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 24
LDI r2, 476
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
