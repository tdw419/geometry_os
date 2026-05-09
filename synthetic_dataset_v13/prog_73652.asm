; DESCRIPTION: Composite: Places a magenta 15x105 rectangle at position (438, 41) then Places a magenta circle of radius 15 at center (64, 217).
; PLAN: r0=438(x), r1=41(y), r2=15(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=217(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 41
LDI r2, 15
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 217
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
