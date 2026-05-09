; DESCRIPTION: Composite: Sets a single green pixel at (182, 81) then Places a black 10x62 rectangle at position (291, 163).
; PLAN: r0=182(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=163(y), r7=10(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 163
LDI r7, 10
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
