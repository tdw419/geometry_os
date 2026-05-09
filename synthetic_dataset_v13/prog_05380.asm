; DESCRIPTION: Composite: Places a magenta line segment connecting (71, 7) to (120, 143) then Sets a single purple pixel at (353, 251).
; PLAN: r0=71(x1), r1=7(y1), r2=120(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=251(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 7
LDI r2, 120
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 251
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
