; DESCRIPTION: Draws a orange line from (378, 142) to (336, 86).
; PLAN: r0=378(x1), r1=142(y1), r2=336(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 142
LDI r2, 336
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
