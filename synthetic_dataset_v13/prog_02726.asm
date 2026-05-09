; DESCRIPTION: Composite: Places a orange dot at position (471, 160) then Draws a green circle centered at (307, 190) with radius 44.
; PLAN: r0=471(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=190(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 471
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 190
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
