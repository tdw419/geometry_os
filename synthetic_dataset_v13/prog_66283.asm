; DESCRIPTION: Composite: Sets a single blue pixel at (246, 157) then Renders a white disk with center (214, 67) and radius 37.
; PLAN: r0=246(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=67(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 67
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
