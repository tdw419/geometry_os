; DESCRIPTION: Renders a black line between points (376, 171) and (158, 249).
; PLAN: r0=376(x1), r1=171(y1), r2=158(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 171
LDI r2, 158
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
