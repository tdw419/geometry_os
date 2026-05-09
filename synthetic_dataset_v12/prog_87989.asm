; DESCRIPTION: Composite: Places a black 89x69 rectangle at position (316, 98) then Renders a white disk with center (307, 158) and radius 10.
; PLAN: r0=316(x), r1=98(y), r2=89(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=158(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 98
LDI r2, 89
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 158
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
