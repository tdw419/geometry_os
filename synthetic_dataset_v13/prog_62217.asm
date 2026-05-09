; DESCRIPTION: Draws a red line from (342, 233) to (351, 47).
; PLAN: r0=342(x1), r1=233(y1), r2=351(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 233
LDI r2, 351
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
