; DESCRIPTION: Composite: Sets a single orange pixel at (287, 127) then Draws a yellow rectangle at (178, 44) with width 69 and height 49.
; PLAN: r0=287(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=44(y), r7=69(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 178
LDI r6, 44
LDI r7, 69
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
