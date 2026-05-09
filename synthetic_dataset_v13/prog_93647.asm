; DESCRIPTION: Places a red line segment connecting (452, 159) to (234, 97).
; PLAN: r0=452(x1), r1=159(y1), r2=234(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 159
LDI r2, 234
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
