; DESCRIPTION: Composite: Creates a red rectangular region at (304, 132) spanning 113 by 103 pixels then Places a orange dot at position (347, 45).
; PLAN: r0=304(x), r1=132(y), r2=113(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=45(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 132
LDI r2, 113
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 45
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
