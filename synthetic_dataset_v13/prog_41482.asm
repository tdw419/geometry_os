; DESCRIPTION: Composite: Sets a single orange pixel at (472, 96) then Draws a white line from (99, 199) to (74, 68).
; PLAN: r0=472(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=99(x1), r6=199(y1), r7=74(x2), r8=68(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 99
LDI r6, 199
LDI r7, 74
LDI r8, 68
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
