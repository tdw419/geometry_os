; DESCRIPTION: Composite: Sets a single yellow pixel at (244, 143) then Draws a magenta rectangle at (30, 122) with width 36 and height 118.
; PLAN: r0=244(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=122(y), r7=36(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 143
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 122
LDI r7, 36
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
