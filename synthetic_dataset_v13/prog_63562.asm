; DESCRIPTION: Composite: Creates a purple rectangular region at (239, 184) spanning 81 by 11 pixels then Places a red dot at position (247, 106).
; PLAN: r0=239(x), r1=184(y), r2=81(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=106(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 184
LDI r2, 81
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 106
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
