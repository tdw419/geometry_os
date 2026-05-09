; DESCRIPTION: Composite: Renders a green line between points (316, 152) and (375, 15) then Sets a single green pixel at (382, 94).
; PLAN: r0=316(x1), r1=152(y1), r2=375(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=94(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 152
LDI r2, 375
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 94
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
