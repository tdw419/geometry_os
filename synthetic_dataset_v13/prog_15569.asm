; DESCRIPTION: Composite: Draws a orange circle centered at (183, 46) with radius 17 then Places a white 88x43 rectangle at position (131, 76).
; PLAN: r0=183(x), r1=46(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=76(y), r7=88(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 46
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 76
LDI r7, 88
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
