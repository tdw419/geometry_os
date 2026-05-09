; DESCRIPTION: Composite: Draws a black rectangle at (280, 179) with width 54 and height 39 then Places a orange dot at position (88, 40).
; PLAN: r0=280(x), r1=179(y), r2=54(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=40(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 179
LDI r2, 54
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 40
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
