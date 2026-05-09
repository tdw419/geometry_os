; DESCRIPTION: Composite: Places a orange dot at position (134, 102) then Draws a cyan circle centered at (215, 76) with radius 51.
; PLAN: r0=134(x), r1=102(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=76(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 102
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 215
LDI r6, 76
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
