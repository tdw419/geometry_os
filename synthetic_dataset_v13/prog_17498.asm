; DESCRIPTION: Composite: Draws a black circle centered at (262, 139) with radius 67 then Places a blue dot at position (106, 160).
; PLAN: r0=262(x), r1=139(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=160(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 139
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 160
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
