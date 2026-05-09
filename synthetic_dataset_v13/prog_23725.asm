; DESCRIPTION: Composite: Places a green 23x104 rectangle at position (52, 26) then Creates a blue circular shape at (156, 195) with radius 55.
; PLAN: r0=52(x), r1=26(y), r2=23(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=195(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 26
LDI r2, 23
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 195
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
