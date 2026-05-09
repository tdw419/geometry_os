; DESCRIPTION: Draws a orange line from (190, 160) to (352, 43).
; PLAN: r0=190(x1), r1=160(y1), r2=352(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 160
LDI r2, 352
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
