; DESCRIPTION: Renders a orange line between points (215, 97) and (316, 191).
; PLAN: r0=215(x1), r1=97(y1), r2=316(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 97
LDI r2, 316
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
