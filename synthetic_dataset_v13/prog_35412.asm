; DESCRIPTION: Places a red line segment connecting (458, 247) to (361, 12).
; PLAN: r0=458(x1), r1=247(y1), r2=361(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 247
LDI r2, 361
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
