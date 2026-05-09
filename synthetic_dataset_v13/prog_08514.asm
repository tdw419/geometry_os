; DESCRIPTION: Renders a yellow line between points (308, 103) and (336, 129).
; PLAN: r0=308(x1), r1=103(y1), r2=336(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 103
LDI r2, 336
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
