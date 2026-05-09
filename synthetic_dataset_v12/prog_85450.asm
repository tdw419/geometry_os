; DESCRIPTION: Draws a red line from (504, 26) to (12, 190).
; PLAN: r0=504(x1), r1=26(y1), r2=12(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 26
LDI r2, 12
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
