; DESCRIPTION: Composite: Draws a yellow rectangle at (432, 207) with width 45 and height 44 then Places a yellow dot at position (246, 40).
; PLAN: r0=432(x), r1=207(y), r2=45(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=40(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 207
LDI r2, 45
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 40
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
