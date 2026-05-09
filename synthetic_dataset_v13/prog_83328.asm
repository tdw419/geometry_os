; DESCRIPTION: Places a red line segment connecting (405, 131) to (6, 96).
; PLAN: r0=405(x1), r1=131(y1), r2=6(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 131
LDI r2, 6
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
