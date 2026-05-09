; DESCRIPTION: Composite: Creates a black rectangular region at (54, 128) spanning 52 by 117 pixels then Draws a magenta circle centered at (346, 117) with radius 53.
; PLAN: r0=54(x), r1=128(y), r2=52(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=117(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 128
LDI r2, 52
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 117
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
