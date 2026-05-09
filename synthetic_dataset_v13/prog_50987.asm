; DESCRIPTION: Composite: Draws a cyan line from (400, 48) to (190, 203) then Sets a single orange pixel at (66, 72).
; PLAN: r0=400(x1), r1=48(y1), r2=190(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 48
LDI r2, 190
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
