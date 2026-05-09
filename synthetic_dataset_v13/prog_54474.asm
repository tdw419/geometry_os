; DESCRIPTION: Composite: Places a green 19x93 rectangle at position (376, 73) then Creates a cyan circular shape at (204, 74) with radius 43.
; PLAN: r0=376(x), r1=73(y), r2=19(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=74(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 73
LDI r2, 19
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 74
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
