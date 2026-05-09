; DESCRIPTION: Draws a orange line from (223, 202) to (501, 107).
; PLAN: r0=223(x1), r1=202(y1), r2=501(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 202
LDI r2, 501
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
