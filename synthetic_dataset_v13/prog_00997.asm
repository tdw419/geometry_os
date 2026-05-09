; DESCRIPTION: Composite: Creates a black circular shape at (296, 47) with radius 39 then Places a cyan 89x53 rectangle at position (264, 17).
; PLAN: r0=296(x), r1=47(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=17(y), r7=89(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 47
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 17
LDI r7, 89
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
