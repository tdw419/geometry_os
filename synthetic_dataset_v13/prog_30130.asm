; DESCRIPTION: Composite: Sets a single magenta pixel at (274, 145) then Draws a green rectangle at (184, 224) with width 106 and height 15.
; PLAN: r0=274(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=224(y), r7=106(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 224
LDI r7, 106
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
