; DESCRIPTION: Composite: Sets a single yellow pixel at (507, 28) then Draws a magenta circle centered at (375, 157) with radius 19.
; PLAN: r0=507(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=157(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 375
LDI r6, 157
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
