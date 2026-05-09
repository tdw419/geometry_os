; DESCRIPTION: Composite: Creates a cyan rectangular region at (289, 138) spanning 42 by 62 pixels then Places a white dot at position (88, 191).
; PLAN: r0=289(x), r1=138(y), r2=42(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=191(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 138
LDI r2, 42
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 191
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
