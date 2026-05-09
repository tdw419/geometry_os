; DESCRIPTION: Composite: Sets a single yellow pixel at (331, 95) then Draws a orange rectangle at (352, 106) with width 10 and height 88.
; PLAN: r0=331(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=106(y), r7=10(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 352
LDI r6, 106
LDI r7, 10
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
