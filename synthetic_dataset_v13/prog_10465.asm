; DESCRIPTION: Composite: Places a orange dot at position (342, 229) then Draws a cyan circle centered at (200, 86) with radius 71.
; PLAN: r0=342(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=86(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 200
LDI r6, 86
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
