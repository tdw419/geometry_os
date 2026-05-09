; DESCRIPTION: Composite: Creates a blue circular shape at (232, 177) with radius 78 then Places a blue dot at position (455, 12).
; PLAN: r0=232(x), r1=177(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=12(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 177
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 12
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
