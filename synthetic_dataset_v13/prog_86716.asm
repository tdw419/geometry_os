; DESCRIPTION: Places a black line segment connecting (511, 198) to (486, 250).
; PLAN: r0=511(x1), r1=198(y1), r2=486(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 198
LDI r2, 486
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
