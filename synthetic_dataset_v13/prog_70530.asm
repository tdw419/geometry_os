; DESCRIPTION: Composite: Sets a single orange pixel at (448, 44) then Draws a orange circle centered at (333, 207) with radius 44.
; PLAN: r0=448(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=207(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 448
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 333
LDI r6, 207
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
