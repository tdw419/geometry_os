; DESCRIPTION: Composite: Creates a blue circular shape at (95, 131) with radius 41 then Places a black 86x27 rectangle at position (53, 212).
; PLAN: r0=95(x), r1=131(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=212(y), r7=86(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 131
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 212
LDI r7, 86
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
