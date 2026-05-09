; DESCRIPTION: Composite: Places a orange 20x91 rectangle at position (80, 139) then Creates a black circular shape at (309, 99) with radius 26.
; PLAN: r0=80(x), r1=139(y), r2=20(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=99(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 139
LDI r2, 20
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 99
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
