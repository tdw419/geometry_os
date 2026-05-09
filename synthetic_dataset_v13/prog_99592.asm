; DESCRIPTION: Draws a red line from (157, 31) to (447, 90).
; PLAN: r0=157(x1), r1=31(y1), r2=447(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 31
LDI r2, 447
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
