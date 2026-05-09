; DESCRIPTION: Places a red line segment connecting (95, 114) to (99, 122).
; PLAN: r0=95(x1), r1=114(y1), r2=99(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 114
LDI r2, 99
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
