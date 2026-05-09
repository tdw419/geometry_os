; DESCRIPTION: Draws a orange line from (161, 97) to (366, 117).
; PLAN: r0=161(x1), r1=97(y1), r2=366(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 97
LDI r2, 366
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
