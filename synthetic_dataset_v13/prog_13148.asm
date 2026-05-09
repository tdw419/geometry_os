; DESCRIPTION: Places a red line segment connecting (467, 199) to (60, 96).
; PLAN: r0=467(x1), r1=199(y1), r2=60(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 199
LDI r2, 60
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
