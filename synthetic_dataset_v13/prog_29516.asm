; DESCRIPTION: Places a red line segment connecting (58, 61) to (149, 102).
; PLAN: r0=58(x1), r1=61(y1), r2=149(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 61
LDI r2, 149
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
