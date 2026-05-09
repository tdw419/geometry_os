; DESCRIPTION: Composite: Places a black 115x67 rectangle at position (335, 76) then Creates a magenta circular shape at (233, 156) with radius 64.
; PLAN: r0=335(x), r1=76(y), r2=115(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=156(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 76
LDI r2, 115
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 156
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
