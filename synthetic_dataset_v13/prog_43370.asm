; DESCRIPTION: Composite: Sets a single purple pixel at (383, 125) then Draws a red line from (201, 148) to (504, 11).
; PLAN: r0=383(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=148(y1), r7=504(x2), r8=11(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 148
LDI r7, 504
LDI r8, 11
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
