; DESCRIPTION: Places a red line segment connecting (339, 194) to (175, 68).
; PLAN: r0=339(x1), r1=194(y1), r2=175(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 194
LDI r2, 175
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
