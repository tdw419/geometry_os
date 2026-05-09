; DESCRIPTION: Places a red line segment connecting (370, 190) to (300, 10).
; PLAN: r0=370(x1), r1=190(y1), r2=300(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 190
LDI r2, 300
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
