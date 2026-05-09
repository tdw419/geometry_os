; DESCRIPTION: Renders a magenta line between points (41, 179) and (476, 244).
; PLAN: r0=41(x1), r1=179(y1), r2=476(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 179
LDI r2, 476
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
