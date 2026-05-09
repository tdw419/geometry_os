; DESCRIPTION: Composite: Sets a single purple pixel at (82, 236) then Places a orange circle of radius 46 at center (64, 190).
; PLAN: r0=82(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=190(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 190
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
