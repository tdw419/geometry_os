; DESCRIPTION: Composite: Places a orange 62x79 rectangle at position (383, 42) then Draws a black circle centered at (405, 183) with radius 50.
; PLAN: r0=383(x), r1=42(y), r2=62(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=183(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 42
LDI r2, 62
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 183
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
