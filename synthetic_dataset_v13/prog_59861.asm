; DESCRIPTION: Composite: Places a orange 106x61 rectangle at position (271, 69) then Creates a white circular shape at (138, 183) with radius 67.
; PLAN: r0=271(x), r1=69(y), r2=106(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=183(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 69
LDI r2, 106
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 183
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
