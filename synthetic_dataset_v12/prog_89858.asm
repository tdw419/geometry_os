; DESCRIPTION: Draws a black line from (88, 155) to (383, 170).
; PLAN: r0=88(x1), r1=155(y1), r2=383(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 155
LDI r2, 383
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
