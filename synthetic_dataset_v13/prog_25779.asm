; DESCRIPTION: Draws a black line from (194, 199) to (86, 229).
; PLAN: r0=194(x1), r1=199(y1), r2=86(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 199
LDI r2, 86
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
