; DESCRIPTION: Composite: Draws a white rectangle at (305, 101) with width 12 and height 82 then Creates a magenta circular shape at (390, 126) with radius 72.
; PLAN: r0=305(x), r1=101(y), r2=12(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=126(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 101
LDI r2, 12
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 126
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
