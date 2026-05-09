; DESCRIPTION: Draws a black line from (229, 43) to (181, 199).
; PLAN: r0=229(x1), r1=43(y1), r2=181(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 43
LDI r2, 181
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
