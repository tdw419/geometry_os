; DESCRIPTION: Composite: Creates a white rectangular region at (352, 37) spanning 82 by 89 pixels then Draws a magenta circle centered at (383, 136) with radius 59.
; PLAN: r0=352(x), r1=37(y), r2=82(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=136(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 37
LDI r2, 82
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 136
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
