; DESCRIPTION: Composite: Places a purple 75x74 rectangle at position (167, 18) then Sets a single red pixel at (62, 81).
; PLAN: r0=167(x), r1=18(y), r2=75(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=81(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 18
LDI r2, 75
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 81
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
