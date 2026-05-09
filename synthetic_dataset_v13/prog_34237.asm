; DESCRIPTION: Composite: Places a white 23x77 rectangle at position (13, 49) then Sets a single blue pixel at (23, 21).
; PLAN: r0=13(x), r1=49(y), r2=23(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=21(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 13
LDI r1, 49
LDI r2, 23
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 21
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
