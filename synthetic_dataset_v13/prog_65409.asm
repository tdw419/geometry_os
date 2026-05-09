; DESCRIPTION: Draws a orange line from (87, 235) to (39, 41).
; PLAN: r0=87(x1), r1=235(y1), r2=39(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 235
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
