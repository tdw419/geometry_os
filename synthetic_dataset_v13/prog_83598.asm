; DESCRIPTION: Places a red line segment connecting (382, 26) to (377, 101).
; PLAN: r0=382(x1), r1=26(y1), r2=377(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 26
LDI r2, 377
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
