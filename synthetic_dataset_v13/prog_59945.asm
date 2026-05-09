; DESCRIPTION: Composite: Renders a white box of size 116x64 starting at (148, 173) then Draws a magenta circle centered at (354, 109) with radius 26.
; PLAN: r0=148(x), r1=173(y), r2=116(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=109(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 173
LDI r2, 116
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 109
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
