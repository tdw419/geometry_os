; DESCRIPTION: Composite: Draws a black rectangle at (64, 114) with width 42 and height 89 then Places a black dot at position (154, 29).
; PLAN: r0=64(x), r1=114(y), r2=42(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 114
LDI r2, 42
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
HALT
