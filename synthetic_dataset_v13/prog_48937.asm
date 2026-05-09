; DESCRIPTION: Draws a orange line from (6, 17) to (438, 27).
; PLAN: r0=6(x1), r1=17(y1), r2=438(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 17
LDI r2, 438
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
