; DESCRIPTION: Composite: Creates a magenta rectangular region at (45, 173) spanning 83 by 82 pixels then Places a cyan dot at position (170, 205).
; PLAN: r0=45(x), r1=173(y), r2=83(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=205(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 173
LDI r2, 83
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 205
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
