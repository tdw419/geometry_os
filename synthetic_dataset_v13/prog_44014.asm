; DESCRIPTION: Places a red line segment connecting (297, 14) to (108, 140).
; PLAN: r0=297(x1), r1=14(y1), r2=108(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 14
LDI r2, 108
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
