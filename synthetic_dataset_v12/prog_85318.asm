; DESCRIPTION: Composite: Creates a blue circular shape at (332, 114) with radius 12 then Places a green dot at position (136, 188).
; PLAN: r0=332(x), r1=114(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=188(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 114
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 188
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
