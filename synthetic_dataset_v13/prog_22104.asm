; DESCRIPTION: Composite: Renders a yellow disk with center (352, 78) and radius 67 then Places a magenta dot at position (374, 201).
; PLAN: r0=352(x), r1=78(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=201(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 78
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 201
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
