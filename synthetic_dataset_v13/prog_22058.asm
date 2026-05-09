; DESCRIPTION: Places a black line segment connecting (481, 147) to (472, 233).
; PLAN: r0=481(x1), r1=147(y1), r2=472(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 147
LDI r2, 472
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
