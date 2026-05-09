; DESCRIPTION: Places a red line segment connecting (467, 177) to (157, 255).
; PLAN: r0=467(x1), r1=177(y1), r2=157(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 177
LDI r2, 157
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
