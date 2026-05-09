; DESCRIPTION: Composite: Places a cyan 115x39 rectangle at position (86, 54) then Sets a single blue pixel at (376, 117).
; PLAN: r0=86(x), r1=54(y), r2=115(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=117(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 54
LDI r2, 115
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 117
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
