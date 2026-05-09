; DESCRIPTION: Composite: Places a orange dot at position (54, 63) then Creates a cyan circular shape at (266, 78) with radius 60.
; PLAN: r0=54(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=78(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 266
LDI r6, 78
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
