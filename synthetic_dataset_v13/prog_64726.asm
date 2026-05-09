; DESCRIPTION: Composite: Creates a magenta rectangular region at (15, 159) spanning 45 by 58 pixels then Places a white dot at position (43, 91).
; PLAN: r0=15(x), r1=159(y), r2=45(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=91(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 15
LDI r1, 159
LDI r2, 45
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 91
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
