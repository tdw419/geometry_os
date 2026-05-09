; DESCRIPTION: Composite: Draws a red circle centered at (284, 102) with radius 74 then Places a white dot at position (41, 126).
; PLAN: r0=284(x), r1=102(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 102
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
