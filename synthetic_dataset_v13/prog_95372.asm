; DESCRIPTION: Draws a orange line from (438, 41) to (13, 44).
; PLAN: r0=438(x1), r1=41(y1), r2=13(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 41
LDI r2, 13
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
