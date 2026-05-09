; DESCRIPTION: Composite: Places a magenta 79x100 rectangle at position (78, 100) then Creates a white circular shape at (427, 131) with radius 23.
; PLAN: r0=78(x), r1=100(y), r2=79(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=131(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 100
LDI r2, 79
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 131
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
