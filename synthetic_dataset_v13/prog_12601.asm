; DESCRIPTION: Composite: Places a orange 13x14 rectangle at position (363, 184) then Creates a yellow circular shape at (86, 156) with radius 73.
; PLAN: r0=363(x), r1=184(y), r2=13(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=156(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 184
LDI r2, 13
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 156
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
