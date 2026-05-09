; DESCRIPTION: Draws a black line from (31, 181) to (496, 52).
; PLAN: r0=31(x1), r1=181(y1), r2=496(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 181
LDI r2, 496
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
