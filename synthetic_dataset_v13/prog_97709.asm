; DESCRIPTION: Composite: Sets a single red pixel at (144, 234) then Draws a purple rectangle at (53, 19) with width 105 and height 38.
; PLAN: r0=144(x), r1=234(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=19(y), r7=105(width), r8=38(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 234
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 19
LDI r7, 105
LDI r8, 38
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
