; DESCRIPTION: Composite: Sets a single black pixel at (296, 236) then Draws a green rectangle at (60, 69) with width 26 and height 96.
; PLAN: r0=296(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=69(y), r7=26(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 60
LDI r6, 69
LDI r7, 26
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
