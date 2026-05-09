; DESCRIPTION: Draws a orange line from (220, 53) to (99, 252).
; PLAN: r0=220(x1), r1=53(y1), r2=99(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 53
LDI r2, 99
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
