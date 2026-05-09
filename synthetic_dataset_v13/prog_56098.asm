; DESCRIPTION: Draws a orange line from (2, 237) to (306, 206).
; PLAN: r0=2(x1), r1=237(y1), r2=306(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 237
LDI r2, 306
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
