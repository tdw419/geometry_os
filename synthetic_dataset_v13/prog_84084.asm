; DESCRIPTION: Draws a orange line from (458, 199) to (15, 32).
; PLAN: r0=458(x1), r1=199(y1), r2=15(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 199
LDI r2, 15
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
