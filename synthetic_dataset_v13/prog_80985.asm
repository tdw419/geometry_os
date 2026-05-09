; DESCRIPTION: Composite: Creates a white rectangular region at (228, 29) spanning 100 by 46 pixels then Places a magenta circle of radius 19 at center (256, 137).
; PLAN: r0=228(x), r1=29(y), r2=100(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=137(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 29
LDI r2, 100
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 137
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
