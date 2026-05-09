; DESCRIPTION: Composite: Places a orange dot at position (427, 6) then Creates a red circular shape at (419, 212) with radius 16.
; PLAN: r0=427(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=212(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 419
LDI r6, 212
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
