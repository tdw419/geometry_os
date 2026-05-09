; DESCRIPTION: Composite: Creates a yellow rectangular region at (97, 95) spanning 31 by 82 pixels then Places a white dot at position (424, 206).
; PLAN: r0=97(x), r1=95(y), r2=31(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=206(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 95
LDI r2, 31
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 206
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
