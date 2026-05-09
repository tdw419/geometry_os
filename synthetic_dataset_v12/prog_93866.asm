; DESCRIPTION: Draws a black line from (472, 81) to (496, 172).
; PLAN: r0=472(x1), r1=81(y1), r2=496(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 81
LDI r2, 496
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
