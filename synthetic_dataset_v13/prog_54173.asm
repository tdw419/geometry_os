; DESCRIPTION: Composite: Places a black 87x99 rectangle at position (304, 128) then Sets a single red pixel at (375, 230).
; PLAN: r0=304(x), r1=128(y), r2=87(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=230(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 128
LDI r2, 87
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 230
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
