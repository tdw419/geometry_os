; DESCRIPTION: Draws a orange line from (183, 116) to (91, 202).
; PLAN: r0=183(x1), r1=116(y1), r2=91(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 116
LDI r2, 91
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
