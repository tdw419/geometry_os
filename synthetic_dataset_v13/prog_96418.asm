; DESCRIPTION: Composite: Draws a orange line from (228, 175) to (156, 161) then Sets a single blue pixel at (131, 18).
; PLAN: r0=228(x1), r1=175(y1), r2=156(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=18(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 175
LDI r2, 156
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 18
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
