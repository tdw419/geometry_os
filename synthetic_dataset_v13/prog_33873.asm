; DESCRIPTION: Composite: Places a red 113x15 rectangle at position (321, 202) then Sets a single green pixel at (490, 64).
; PLAN: r0=321(x), r1=202(y), r2=113(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=64(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 202
LDI r2, 113
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 64
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
