; DESCRIPTION: Composite: Places a red dot at position (212, 162) then Draws a purple line from (178, 176) to (134, 5).
; PLAN: r0=212(x), r1=162(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=176(y1), r7=134(x2), r8=5(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 162
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 178
LDI r6, 176
LDI r7, 134
LDI r8, 5
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
