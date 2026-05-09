; DESCRIPTION: Places a orange line segment connecting (155, 195) to (101, 143).
; PLAN: r0=155(x1), r1=195(y1), r2=101(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 195
LDI r2, 101
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
