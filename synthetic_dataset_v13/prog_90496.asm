; DESCRIPTION: Composite: Draws a cyan rectangle at (64, 42) with width 114 and height 60 then Sets a single red pixel at (355, 87).
; PLAN: r0=64(x), r1=42(y), r2=114(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 42
LDI r2, 114
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
