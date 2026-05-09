; DESCRIPTION: Draws a orange line from (353, 245) to (380, 127).
; PLAN: r0=353(x1), r1=245(y1), r2=380(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 245
LDI r2, 380
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
