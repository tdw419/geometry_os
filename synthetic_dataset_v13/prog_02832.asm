; DESCRIPTION: Draws a red line from (477, 146) to (373, 82).
; PLAN: r0=477(x1), r1=146(y1), r2=373(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 146
LDI r2, 373
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
