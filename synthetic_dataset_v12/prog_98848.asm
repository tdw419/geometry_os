; DESCRIPTION: Places a red line segment connecting (423, 156) to (286, 127).
; PLAN: r0=423(x1), r1=156(y1), r2=286(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 156
LDI r2, 286
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
