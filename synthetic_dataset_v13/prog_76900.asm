; DESCRIPTION: Places a red line segment connecting (382, 38) to (339, 123).
; PLAN: r0=382(x1), r1=38(y1), r2=339(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 38
LDI r2, 339
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
