; DESCRIPTION: Composite: Renders a magenta disk with center (242, 83) and radius 69 then Places a blue dot at position (261, 251).
; PLAN: r0=242(x), r1=83(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=251(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 83
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 251
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
