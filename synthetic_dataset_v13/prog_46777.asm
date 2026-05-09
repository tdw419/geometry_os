; DESCRIPTION: Places a red line segment connecting (89, 116) to (299, 216).
; PLAN: r0=89(x1), r1=116(y1), r2=299(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 116
LDI r2, 299
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
