; DESCRIPTION: Composite: Creates a yellow circular shape at (239, 53) with radius 30 then Places a yellow 33x71 rectangle at position (361, 19).
; PLAN: r0=239(x), r1=53(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=19(y), r7=33(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 53
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 19
LDI r7, 33
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
