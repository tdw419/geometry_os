; DESCRIPTION: Composite: Creates a white rectangular region at (414, 48) spanning 76 by 53 pixels then Places a red dot at position (410, 101).
; PLAN: r0=414(x), r1=48(y), r2=76(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 48
LDI r2, 76
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
