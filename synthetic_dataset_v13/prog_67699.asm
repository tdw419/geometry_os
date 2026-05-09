; DESCRIPTION: Places a red line segment connecting (476, 190) to (443, 47).
; PLAN: r0=476(x1), r1=190(y1), r2=443(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 190
LDI r2, 443
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
