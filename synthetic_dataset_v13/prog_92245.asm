; DESCRIPTION: Composite: Draws a green line from (152, 72) to (497, 16) then Sets a single green pixel at (77, 156).
; PLAN: r0=152(x1), r1=72(y1), r2=497(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=156(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 72
LDI r2, 497
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 156
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
