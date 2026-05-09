; DESCRIPTION: Composite: Places a magenta 114x109 rectangle at position (87, 121) then Creates a cyan circular shape at (300, 119) with radius 11.
; PLAN: r0=87(x), r1=121(y), r2=114(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=119(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 121
LDI r2, 114
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 119
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
