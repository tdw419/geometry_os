; DESCRIPTION: Renders a yellow line between points (372, 153) and (476, 45).
; PLAN: r0=372(x1), r1=153(y1), r2=476(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 153
LDI r2, 476
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
