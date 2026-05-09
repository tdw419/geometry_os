; DESCRIPTION: Draws a red line from (477, 116) to (417, 172).
; PLAN: r0=477(x1), r1=116(y1), r2=417(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 116
LDI r2, 417
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
