; DESCRIPTION: Composite: Sets a single orange pixel at (492, 86) then Draws a purple line from (424, 91) to (397, 102).
; PLAN: r0=492(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=424(x1), r6=91(y1), r7=397(x2), r8=102(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 424
LDI r6, 91
LDI r7, 397
LDI r8, 102
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
