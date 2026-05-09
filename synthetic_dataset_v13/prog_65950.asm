; DESCRIPTION: Renders a red line between points (476, 32) and (328, 208).
; PLAN: r0=476(x1), r1=32(y1), r2=328(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 32
LDI r2, 328
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
