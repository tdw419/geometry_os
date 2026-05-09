; DESCRIPTION: Places a red line segment connecting (395, 94) to (467, 179).
; PLAN: r0=395(x1), r1=94(y1), r2=467(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 94
LDI r2, 467
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
