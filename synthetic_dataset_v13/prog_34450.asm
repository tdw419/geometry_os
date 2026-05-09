; DESCRIPTION: Composite: Places a yellow line segment connecting (165, 39) to (489, 201) then Places a orange dot at position (157, 156).
; PLAN: r0=165(x1), r1=39(y1), r2=489(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=156(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 39
LDI r2, 489
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 156
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
