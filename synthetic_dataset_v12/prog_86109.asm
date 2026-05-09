; DESCRIPTION: Places a yellow line segment connecting (452, 66) to (182, 100).
; PLAN: r0=452(x1), r1=66(y1), r2=182(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 66
LDI r2, 182
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
