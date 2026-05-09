; DESCRIPTION: Places a red line segment connecting (483, 93) to (477, 100).
; PLAN: r0=483(x1), r1=93(y1), r2=477(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 93
LDI r2, 477
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
