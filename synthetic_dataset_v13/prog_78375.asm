; DESCRIPTION: Composite: Sets a single orange pixel at (484, 145) then Draws a blue line from (32, 246) to (467, 213).
; PLAN: r0=484(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=32(x1), r6=246(y1), r7=467(x2), r8=213(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 32
LDI r6, 246
LDI r7, 467
LDI r8, 213
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
