; DESCRIPTION: Places a red line segment connecting (391, 139) to (467, 209).
; PLAN: r0=391(x1), r1=139(y1), r2=467(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 139
LDI r2, 467
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
