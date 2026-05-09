; DESCRIPTION: Draws a orange line from (118, 194) to (113, 204).
; PLAN: r0=118(x1), r1=194(y1), r2=113(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 194
LDI r2, 113
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
