; DESCRIPTION: Composite: Draws a cyan circle centered at (254, 203) with radius 25 then Places a black 89x69 rectangle at position (311, 20).
; PLAN: r0=254(x), r1=203(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=20(y), r7=89(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 203
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 20
LDI r7, 89
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
