; DESCRIPTION: Composite: Places a red 53x100 rectangle at position (362, 67) then Creates a green circular shape at (159, 154) with radius 49.
; PLAN: r0=362(x), r1=67(y), r2=53(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=154(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 67
LDI r2, 53
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 154
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
