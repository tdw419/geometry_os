; DESCRIPTION: Composite: Creates a orange rectangular region at (343, 107) spanning 49 by 107 pixels then Places a orange dot at position (214, 4).
; PLAN: r0=343(x), r1=107(y), r2=49(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 107
LDI r2, 49
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
