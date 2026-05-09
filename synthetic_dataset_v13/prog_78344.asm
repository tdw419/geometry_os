; DESCRIPTION: Composite: Places a orange dot at position (395, 184) then Draws a purple rectangle at (274, 157) with width 92 and height 69.
; PLAN: r0=395(x), r1=184(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=157(y), r7=92(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 184
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 274
LDI r6, 157
LDI r7, 92
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
