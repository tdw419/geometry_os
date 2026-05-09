; DESCRIPTION: Composite: Creates a black circular shape at (143, 213) with radius 20 then Places a orange 85x21 rectangle at position (89, 58).
; PLAN: r0=143(x), r1=213(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=58(y), r7=85(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 213
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 58
LDI r7, 85
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
