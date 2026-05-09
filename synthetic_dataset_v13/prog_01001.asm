; DESCRIPTION: Composite: Places a white dot at position (187, 224) then Draws a magenta circle centered at (237, 230) with radius 15.
; PLAN: r0=187(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=230(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 230
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
