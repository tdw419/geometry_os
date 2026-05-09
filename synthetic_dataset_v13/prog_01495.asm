; DESCRIPTION: Renders a red line between points (307, 70) and (476, 101).
; PLAN: r0=307(x1), r1=70(y1), r2=476(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 70
LDI r2, 476
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
