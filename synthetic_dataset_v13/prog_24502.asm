; DESCRIPTION: Draws a orange line from (182, 176) to (181, 246).
; PLAN: r0=182(x1), r1=176(y1), r2=181(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 176
LDI r2, 181
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
