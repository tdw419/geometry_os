; DESCRIPTION: Draws a orange line from (477, 176) to (471, 220).
; PLAN: r0=477(x1), r1=176(y1), r2=471(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 176
LDI r2, 471
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
