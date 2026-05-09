; DESCRIPTION: Composite: Creates a purple rectangular region at (319, 156) spanning 92 by 32 pixels then Places a magenta circle of radius 61 at center (333, 166).
; PLAN: r0=319(x), r1=156(y), r2=92(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=166(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 156
LDI r2, 92
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 166
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
