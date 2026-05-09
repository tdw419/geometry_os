; DESCRIPTION: Composite: Sets a single yellow pixel at (139, 162) then Draws a orange rectangle at (426, 30) with width 16 and height 91.
; PLAN: r0=139(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=30(y), r7=16(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 426
LDI r6, 30
LDI r7, 16
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
