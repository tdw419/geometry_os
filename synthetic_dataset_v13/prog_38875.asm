; DESCRIPTION: Composite: Draws a cyan line from (143, 35) to (225, 15) then Sets a single orange pixel at (510, 156).
; PLAN: r0=143(x1), r1=35(y1), r2=225(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=156(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 35
LDI r2, 225
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 156
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
