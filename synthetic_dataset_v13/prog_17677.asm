; DESCRIPTION: Places a red line segment connecting (421, 246) to (194, 68).
; PLAN: r0=421(x1), r1=246(y1), r2=194(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 246
LDI r2, 194
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
