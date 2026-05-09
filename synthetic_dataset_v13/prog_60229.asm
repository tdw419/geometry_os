; DESCRIPTION: Composite: Renders a white disk with center (352, 66) and radius 56 then Sets a single blue pixel at (154, 150).
; PLAN: r0=352(x), r1=66(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=150(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 66
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 150
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
