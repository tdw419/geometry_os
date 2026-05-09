; DESCRIPTION: Composite: Places a red 64x20 rectangle at position (259, 78) then Sets a single white pixel at (509, 72).
; PLAN: r0=259(x), r1=78(y), r2=64(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=72(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 78
LDI r2, 64
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 72
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
