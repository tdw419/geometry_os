; DESCRIPTION: Draws a orange line from (43, 98) to (458, 40).
; PLAN: r0=43(x1), r1=98(y1), r2=458(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 98
LDI r2, 458
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
