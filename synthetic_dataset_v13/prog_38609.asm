; DESCRIPTION: Draws a red line from (357, 207) to (471, 190).
; PLAN: r0=357(x1), r1=207(y1), r2=471(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 207
LDI r2, 471
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
