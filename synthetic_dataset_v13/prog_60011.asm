; DESCRIPTION: Composite: Sets a single red pixel at (499, 157) then Places a magenta circle of radius 17 at center (212, 18).
; PLAN: r0=499(x), r1=157(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=18(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 157
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 212
LDI r6, 18
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
