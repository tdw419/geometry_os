; DESCRIPTION: Draws a red line from (388, 190) to (473, 241).
; PLAN: r0=388(x1), r1=190(y1), r2=473(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 190
LDI r2, 473
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
