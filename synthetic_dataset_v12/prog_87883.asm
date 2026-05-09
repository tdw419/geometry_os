; DESCRIPTION: Composite: Sets a single blue pixel at (118, 0) then Draws a cyan rectangle at (121, 122) with width 110 and height 76.
; PLAN: r0=118(x), r1=0(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=122(y), r7=110(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 0
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 122
LDI r7, 110
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
