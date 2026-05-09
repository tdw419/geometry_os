; DESCRIPTION: Places a black line segment connecting (411, 186) to (35, 147).
; PLAN: r0=411(x1), r1=186(y1), r2=35(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 186
LDI r2, 35
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
