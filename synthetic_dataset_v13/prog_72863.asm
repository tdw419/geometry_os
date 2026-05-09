; DESCRIPTION: Composite: Draws a magenta line from (332, 197) to (258, 77) then Sets a single green pixel at (11, 162).
; PLAN: r0=332(x1), r1=197(y1), r2=258(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=162(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 197
LDI r2, 258
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 162
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
