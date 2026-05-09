; DESCRIPTION: Composite: Draws a cyan circle centered at (139, 76) with radius 23 then Places a black 103x106 rectangle at position (190, 89).
; PLAN: r0=139(x), r1=76(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=89(y), r7=103(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 76
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 89
LDI r7, 103
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
