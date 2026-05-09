; DESCRIPTION: Draws a black line from (336, 176) to (93, 141).
; PLAN: r0=336(x1), r1=176(y1), r2=93(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 176
LDI r2, 93
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
