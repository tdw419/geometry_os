; DESCRIPTION: Places a red line segment connecting (458, 92) to (233, 195).
; PLAN: r0=458(x1), r1=92(y1), r2=233(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 92
LDI r2, 233
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
