; DESCRIPTION: Draws a orange line from (109, 159) to (259, 187).
; PLAN: r0=109(x1), r1=159(y1), r2=259(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 159
LDI r2, 259
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
