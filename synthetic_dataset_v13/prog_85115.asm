; DESCRIPTION: Composite: Sets a single red pixel at (485, 232) then Draws a purple rectangle at (442, 85) with width 42 and height 83.
; PLAN: r0=485(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=85(y), r7=42(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 485
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 442
LDI r6, 85
LDI r7, 42
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
