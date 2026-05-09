; DESCRIPTION: Draws a orange line from (130, 117) to (261, 193).
; PLAN: r0=130(x1), r1=117(y1), r2=261(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 117
LDI r2, 261
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
