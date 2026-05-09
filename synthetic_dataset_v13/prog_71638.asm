; DESCRIPTION: Draws a orange line from (87, 167) to (359, 51).
; PLAN: r0=87(x1), r1=167(y1), r2=359(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 167
LDI r2, 359
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
