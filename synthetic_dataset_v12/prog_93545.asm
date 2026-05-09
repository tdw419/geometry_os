; DESCRIPTION: Composite: Places a purple dot at position (316, 190) then Draws a yellow line from (169, 176) to (279, 171).
; PLAN: r0=316(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=176(y1), r7=279(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 176
LDI r7, 279
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
