; DESCRIPTION: Draws a orange line from (306, 40) to (3, 86).
; PLAN: r0=306(x1), r1=40(y1), r2=3(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 40
LDI r2, 3
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
