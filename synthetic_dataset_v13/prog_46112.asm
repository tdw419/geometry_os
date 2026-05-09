; DESCRIPTION: Composite: Sets a single purple pixel at (213, 4) then Places a yellow circle of radius 12 at center (309, 39).
; PLAN: r0=213(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=39(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 4
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 39
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
