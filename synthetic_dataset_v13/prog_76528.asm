; DESCRIPTION: Places a red line segment connecting (251, 226) to (467, 232).
; PLAN: r0=251(x1), r1=226(y1), r2=467(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 226
LDI r2, 467
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
