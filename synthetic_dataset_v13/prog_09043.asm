; DESCRIPTION: Composite: Draws a purple circle centered at (371, 118) with radius 60 then Places a yellow 45x104 rectangle at position (233, 132).
; PLAN: r0=371(x), r1=118(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=132(y), r7=45(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 118
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 132
LDI r7, 45
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
