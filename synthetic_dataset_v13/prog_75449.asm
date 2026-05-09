; DESCRIPTION: Composite: Draws a cyan circle centered at (89, 76) with radius 64 then Places a black 71x89 rectangle at position (415, 3).
; PLAN: r0=89(x), r1=76(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=3(y), r7=71(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 76
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 3
LDI r7, 71
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
