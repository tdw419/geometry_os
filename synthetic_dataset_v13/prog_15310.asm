; DESCRIPTION: Composite: Places a purple 64x106 rectangle at position (128, 111) then Sets a single purple pixel at (1, 102).
; PLAN: r0=128(x), r1=111(y), r2=64(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 111
LDI r2, 64
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
