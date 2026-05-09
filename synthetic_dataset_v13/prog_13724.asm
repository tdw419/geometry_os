; DESCRIPTION: Composite: Places a orange 83x42 rectangle at position (414, 59) then Sets a single white pixel at (263, 15).
; PLAN: r0=414(x), r1=59(y), r2=83(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 59
LDI r2, 83
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
