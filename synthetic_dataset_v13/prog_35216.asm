; DESCRIPTION: Draws a red line from (383, 15) to (342, 31).
; PLAN: r0=383(x1), r1=15(y1), r2=342(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 15
LDI r2, 342
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
