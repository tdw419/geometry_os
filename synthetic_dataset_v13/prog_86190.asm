; DESCRIPTION: Composite: Draws a cyan line from (9, 122) to (346, 156) then Sets a single blue pixel at (98, 79).
; PLAN: r0=9(x1), r1=122(y1), r2=346(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=79(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 122
LDI r2, 346
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 79
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
