; DESCRIPTION: Composite: Places a black 44x118 rectangle at position (66, 55) then Creates a magenta circular shape at (350, 109) with radius 70.
; PLAN: r0=66(x), r1=55(y), r2=44(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=109(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 55
LDI r2, 44
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 109
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
