; DESCRIPTION: Composite: Draws a white rectangle at (254, 143) with width 78 and height 92 then Places a orange dot at position (53, 117).
; PLAN: r0=254(x), r1=143(y), r2=78(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 143
LDI r2, 78
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
