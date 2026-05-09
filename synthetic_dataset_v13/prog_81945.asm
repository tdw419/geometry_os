; DESCRIPTION: Places a red line segment connecting (439, 92) to (319, 211).
; PLAN: r0=439(x1), r1=92(y1), r2=319(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 92
LDI r2, 319
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
