; DESCRIPTION: Composite: Places a orange dot at position (326, 106) then Draws a cyan circle centered at (241, 88) with radius 60.
; PLAN: r0=326(x), r1=106(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=88(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 106
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 241
LDI r6, 88
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
