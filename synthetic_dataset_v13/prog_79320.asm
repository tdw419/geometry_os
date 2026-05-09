; DESCRIPTION: Composite: Renders a orange box of size 45x114 starting at (375, 96) then Places a black dot at position (333, 166).
; PLAN: r0=375(x), r1=96(y), r2=45(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 96
LDI r2, 45
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
HALT
