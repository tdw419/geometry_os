; DESCRIPTION: Draws a orange line from (491, 68) to (307, 84).
; PLAN: r0=491(x1), r1=68(y1), r2=307(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 68
LDI r2, 307
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
