; DESCRIPTION: Places a red line segment connecting (456, 170) to (349, 33).
; PLAN: r0=456(x1), r1=170(y1), r2=349(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 170
LDI r2, 349
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
