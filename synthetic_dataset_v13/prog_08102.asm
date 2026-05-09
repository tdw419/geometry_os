; DESCRIPTION: Composite: Creates a green circular shape at (473, 106) with radius 33 then Places a purple 18x50 rectangle at position (173, 89).
; PLAN: r0=473(x), r1=106(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=89(y), r7=18(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 106
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 89
LDI r7, 18
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
