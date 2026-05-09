; DESCRIPTION: Composite: Sets a single blue pixel at (125, 157) then Places a cyan circle of radius 28 at center (396, 187).
; PLAN: r0=125(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=187(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 187
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
