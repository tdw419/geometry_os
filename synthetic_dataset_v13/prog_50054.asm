; DESCRIPTION: Draws a black line from (347, 56) to (2, 58).
; PLAN: r0=347(x1), r1=56(y1), r2=2(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 56
LDI r2, 2
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
