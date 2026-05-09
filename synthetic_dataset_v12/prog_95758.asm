; DESCRIPTION: Draws a orange line from (378, 125) to (450, 158).
; PLAN: r0=378(x1), r1=125(y1), r2=450(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 125
LDI r2, 450
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
