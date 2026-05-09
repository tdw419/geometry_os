; DESCRIPTION: Draws a orange line from (378, 179) to (172, 240).
; PLAN: r0=378(x1), r1=179(y1), r2=172(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 179
LDI r2, 172
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
