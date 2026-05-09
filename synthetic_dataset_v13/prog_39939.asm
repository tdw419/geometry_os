; DESCRIPTION: Draws a orange line from (328, 176) to (411, 56).
; PLAN: r0=328(x1), r1=176(y1), r2=411(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 176
LDI r2, 411
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
