; DESCRIPTION: Composite: Draws a cyan circle centered at (460, 79) with radius 48 then Places a white dot at position (211, 190).
; PLAN: r0=460(x), r1=79(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=190(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 79
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 190
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
