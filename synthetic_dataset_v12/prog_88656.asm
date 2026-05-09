; DESCRIPTION: Composite: Sets a single black pixel at (8, 40) then Draws a black rectangle at (412, 1) with width 52 and height 41.
; PLAN: r0=8(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=1(y), r7=52(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 412
LDI r6, 1
LDI r7, 52
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
