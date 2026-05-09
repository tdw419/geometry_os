; DESCRIPTION: Composite: Sets a single red pixel at (418, 194) then Places a magenta circle of radius 49 at center (288, 135).
; PLAN: r0=418(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=135(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 288
LDI r6, 135
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
