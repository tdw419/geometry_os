; DESCRIPTION: Composite: Places a purple 19x45 rectangle at position (242, 187) then Creates a magenta circular shape at (379, 104) with radius 70.
; PLAN: r0=242(x), r1=187(y), r2=19(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=104(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 187
LDI r2, 19
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 104
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
