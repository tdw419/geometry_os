; DESCRIPTION: Draws a orange line from (130, 123) to (190, 171).
; PLAN: r0=130(x1), r1=123(y1), r2=190(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 123
LDI r2, 190
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
