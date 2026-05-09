; DESCRIPTION: Composite: Places a green dot at position (138, 126) then Draws a blue circle centered at (341, 158) with radius 76.
; PLAN: r0=138(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=158(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 341
LDI r6, 158
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
