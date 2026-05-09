; DESCRIPTION: Places a black line segment connecting (383, 187) to (278, 147).
; PLAN: r0=383(x1), r1=187(y1), r2=278(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 187
LDI r2, 278
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
