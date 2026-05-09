; DESCRIPTION: Composite: Draws a magenta line from (494, 97) to (379, 60) then Places a orange dot at position (194, 4).
; PLAN: r0=494(x1), r1=97(y1), r2=379(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 494
LDI r1, 97
LDI r2, 379
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
