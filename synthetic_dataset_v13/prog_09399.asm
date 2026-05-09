; DESCRIPTION: Composite: Creates a blue circular shape at (194, 94) with radius 71 then Places a purple 18x83 rectangle at position (167, 13).
; PLAN: r0=194(x), r1=94(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=13(y), r7=18(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 94
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 13
LDI r7, 18
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
