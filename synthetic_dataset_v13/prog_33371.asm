; DESCRIPTION: Draws a orange line from (452, 97) to (182, 243).
; PLAN: r0=452(x1), r1=97(y1), r2=182(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 97
LDI r2, 182
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
