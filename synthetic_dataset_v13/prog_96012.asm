; DESCRIPTION: Composite: Draws a orange circle centered at (268, 157) with radius 74 then Places a orange 93x62 rectangle at position (117, 18).
; PLAN: r0=268(x), r1=157(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=18(y), r7=93(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 157
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 18
LDI r7, 93
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
