; DESCRIPTION: Composite: Places a black 82x108 rectangle at position (318, 87) then Places a white dot at position (301, 56).
; PLAN: r0=318(x), r1=87(y), r2=82(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=56(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 87
LDI r2, 82
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 56
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
