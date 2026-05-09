; DESCRIPTION: Composite: Places a white circle of radius 76 at center (296, 158) then Places a orange 35x61 rectangle at position (20, 45).
; PLAN: r0=296(x), r1=158(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=45(y), r7=35(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 158
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 45
LDI r7, 35
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
