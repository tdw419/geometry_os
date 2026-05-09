; DESCRIPTION: Draws a black line from (496, 251) to (4, 187).
; PLAN: r0=496(x1), r1=251(y1), r2=4(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 251
LDI r2, 4
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
