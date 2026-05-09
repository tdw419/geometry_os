; DESCRIPTION: Places a red line segment connecting (383, 185) to (152, 190).
; PLAN: r0=383(x1), r1=185(y1), r2=152(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 185
LDI r2, 152
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
