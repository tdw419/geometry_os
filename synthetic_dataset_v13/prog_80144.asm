; DESCRIPTION: Draws a purple line from (343, 74) to (324, 41).
; PLAN: r0=343(x1), r1=74(y1), r2=324(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 74
LDI r2, 324
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
