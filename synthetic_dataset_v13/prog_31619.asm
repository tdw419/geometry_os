; DESCRIPTION: Composite: Draws a black rectangle at (469, 198) with width 11 and height 36 then Places a red dot at position (292, 47).
; PLAN: r0=469(x), r1=198(y), r2=11(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=47(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 469
LDI r1, 198
LDI r2, 11
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 47
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
