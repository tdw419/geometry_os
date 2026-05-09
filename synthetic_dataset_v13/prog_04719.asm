; DESCRIPTION: Draws a orange line from (261, 181) to (228, 84).
; PLAN: r0=261(x1), r1=181(y1), r2=228(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 181
LDI r2, 228
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
