; DESCRIPTION: Draws a black line from (252, 218) to (496, 197).
; PLAN: r0=252(x1), r1=218(y1), r2=496(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 218
LDI r2, 496
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
