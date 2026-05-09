; DESCRIPTION: Composite: Creates a magenta rectangular region at (465, 158) spanning 32 by 81 pixels then Sets a single white pixel at (482, 159).
; PLAN: r0=465(x), r1=158(y), r2=32(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=159(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 158
LDI r2, 32
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 159
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
