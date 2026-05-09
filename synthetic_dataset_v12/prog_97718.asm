; DESCRIPTION: Composite: Places a purple 105x11 rectangle at position (209, 178) then Creates a blue circular shape at (285, 175) with radius 37.
; PLAN: r0=209(x), r1=178(y), r2=105(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=175(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 178
LDI r2, 105
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 175
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
