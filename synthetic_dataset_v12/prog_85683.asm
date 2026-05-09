; DESCRIPTION: Draws a orange line from (378, 144) to (286, 38).
; PLAN: r0=378(x1), r1=144(y1), r2=286(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 144
LDI r2, 286
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
