; DESCRIPTION: Draws a orange line from (362, 54) to (158, 155).
; PLAN: r0=362(x1), r1=54(y1), r2=158(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 54
LDI r2, 158
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
