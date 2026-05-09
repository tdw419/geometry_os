; DESCRIPTION: Draws a orange line from (63, 192) to (34, 182).
; PLAN: r0=63(x1), r1=192(y1), r2=34(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 192
LDI r2, 34
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
