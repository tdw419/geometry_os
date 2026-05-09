; DESCRIPTION: Composite: Places a purple 81x72 rectangle at position (267, 99) then Draws a white circle centered at (230, 165) with radius 56.
; PLAN: r0=267(x), r1=99(y), r2=81(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=165(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 99
LDI r2, 81
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 165
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
