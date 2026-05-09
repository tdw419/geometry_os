; DESCRIPTION: Draws a orange line from (467, 182) to (341, 25).
; PLAN: r0=467(x1), r1=182(y1), r2=341(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 182
LDI r2, 341
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
