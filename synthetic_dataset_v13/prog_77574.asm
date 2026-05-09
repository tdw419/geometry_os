; DESCRIPTION: Composite: Creates a white rectangular region at (3, 85) spanning 69 by 48 pixels then Places a magenta dot at position (249, 41).
; PLAN: r0=3(x), r1=85(y), r2=69(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=41(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 3
LDI r1, 85
LDI r2, 69
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 41
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
