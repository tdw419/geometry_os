; DESCRIPTION: Composite: Sets a single purple pixel at (372, 63) then Places a red circle of radius 65 at center (291, 65).
; PLAN: r0=372(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=65(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 65
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
