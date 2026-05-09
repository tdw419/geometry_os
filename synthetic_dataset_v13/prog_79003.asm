; DESCRIPTION: Composite: Creates a white rectangular region at (7, 12) spanning 69 by 117 pixels then Sets a single orange pixel at (361, 101).
; PLAN: r0=7(x), r1=12(y), r2=69(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=101(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 12
LDI r2, 69
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 101
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
