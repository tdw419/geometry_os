; DESCRIPTION: Composite: Creates a black rectangular region at (171, 31) spanning 105 by 82 pixels then Places a red dot at position (3, 67).
; PLAN: r0=171(x), r1=31(y), r2=105(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=67(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 31
LDI r2, 105
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 67
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
