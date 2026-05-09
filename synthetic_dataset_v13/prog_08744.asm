; DESCRIPTION: Draws a orange line from (315, 21) to (118, 43).
; PLAN: r0=315(x1), r1=21(y1), r2=118(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 21
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
