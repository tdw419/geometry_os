; DESCRIPTION: Places a red line segment connecting (101, 98) to (194, 230).
; PLAN: r0=101(x1), r1=98(y1), r2=194(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 98
LDI r2, 194
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
