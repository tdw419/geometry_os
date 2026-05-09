; DESCRIPTION: Composite: Sets a single orange pixel at (215, 153) then Places a white circle of radius 31 at center (82, 72).
; PLAN: r0=215(x), r1=153(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=72(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 153
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 82
LDI r6, 72
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
