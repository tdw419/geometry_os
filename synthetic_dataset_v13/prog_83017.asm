; DESCRIPTION: Places a red line segment connecting (383, 161) to (363, 7).
; PLAN: r0=383(x1), r1=161(y1), r2=363(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 161
LDI r2, 363
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
