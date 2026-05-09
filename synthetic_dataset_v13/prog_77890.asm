; DESCRIPTION: Draws a orange line from (249, 183) to (353, 30).
; PLAN: r0=249(x1), r1=183(y1), r2=353(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 183
LDI r2, 353
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
