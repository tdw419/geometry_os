; DESCRIPTION: Composite: Sets a single black pixel at (296, 165) then Draws a yellow rectangle at (53, 198) with width 90 and height 56.
; PLAN: r0=296(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=198(y), r7=90(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 198
LDI r7, 90
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
