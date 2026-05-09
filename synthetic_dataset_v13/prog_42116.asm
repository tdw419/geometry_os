; DESCRIPTION: Places a red line segment connecting (306, 109) to (8, 246).
; PLAN: r0=306(x1), r1=109(y1), r2=8(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 109
LDI r2, 8
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
