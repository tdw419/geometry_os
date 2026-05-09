; DESCRIPTION: Draws a orange line from (413, 246) to (505, 52).
; PLAN: r0=413(x1), r1=246(y1), r2=505(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 246
LDI r2, 505
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
