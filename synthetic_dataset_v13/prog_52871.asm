; DESCRIPTION: Composite: Sets a single orange pixel at (179, 15) then Draws a purple line from (219, 17) to (412, 9).
; PLAN: r0=179(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=17(y1), r7=412(x2), r8=9(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 219
LDI r6, 17
LDI r7, 412
LDI r8, 9
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
