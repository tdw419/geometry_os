; DESCRIPTION: Composite: Creates a white rectangular region at (17, 156) spanning 23 by 82 pixels then Sets a single magenta pixel at (498, 101).
; PLAN: r0=17(x), r1=156(y), r2=23(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=101(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 156
LDI r2, 23
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 101
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
