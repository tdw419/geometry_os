; DESCRIPTION: Draws a orange line from (246, 8) to (366, 152).
; PLAN: r0=246(x1), r1=8(y1), r2=366(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 8
LDI r2, 366
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
