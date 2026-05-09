; DESCRIPTION: Composite: Creates a purple rectangular region at (352, 14) spanning 115 by 59 pixels then Places a orange dot at position (89, 151).
; PLAN: r0=352(x), r1=14(y), r2=115(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=151(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 14
LDI r2, 115
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 151
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
