; DESCRIPTION: Composite: Creates a purple rectangular region at (13, 102) spanning 64 by 33 pixels then Places a magenta dot at position (476, 216).
; PLAN: r0=13(x), r1=102(y), r2=64(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=216(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 13
LDI r1, 102
LDI r2, 64
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 216
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
