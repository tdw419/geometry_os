; DESCRIPTION: Composite: Draws a magenta line from (331, 71) to (280, 14) then Sets a single orange pixel at (274, 104).
; PLAN: r0=331(x1), r1=71(y1), r2=280(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=104(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 71
LDI r2, 280
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 104
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
