; DESCRIPTION: Draws a orange line from (130, 243) to (114, 206).
; PLAN: r0=130(x1), r1=243(y1), r2=114(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 243
LDI r2, 114
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
