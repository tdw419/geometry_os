; DESCRIPTION: Draws a purple line from (166, 241) to (405, 190).
; PLAN: r0=166(x1), r1=241(y1), r2=405(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 241
LDI r2, 405
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
