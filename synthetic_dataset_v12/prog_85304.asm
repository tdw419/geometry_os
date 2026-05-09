; DESCRIPTION: Composite: Places a magenta circle of radius 27 at center (93, 178) then Places a red 11x96 rectangle at position (477, 19).
; PLAN: r0=93(x), r1=178(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=19(y), r7=11(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 178
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 19
LDI r7, 11
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
