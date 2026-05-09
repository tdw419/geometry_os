; DESCRIPTION: Composite: Draws a yellow circle centered at (109, 175) with radius 11 then Places a green 53x20 rectangle at position (254, 233).
; PLAN: r0=109(x), r1=175(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=233(y), r7=53(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 175
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 233
LDI r7, 53
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
