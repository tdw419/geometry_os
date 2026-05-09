; DESCRIPTION: Draws a orange line from (82, 127) to (304, 252).
; PLAN: r0=82(x1), r1=127(y1), r2=304(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 127
LDI r2, 304
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
