; DESCRIPTION: Places a black line segment connecting (336, 121) to (42, 217).
; PLAN: r0=336(x1), r1=121(y1), r2=42(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 121
LDI r2, 42
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
