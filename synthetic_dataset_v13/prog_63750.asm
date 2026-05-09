; DESCRIPTION: Draws a orange line from (43, 88) to (329, 190).
; PLAN: r0=43(x1), r1=88(y1), r2=329(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 88
LDI r2, 329
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
