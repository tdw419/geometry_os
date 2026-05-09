; DESCRIPTION: Composite: Places a purple 114x45 rectangle at position (162, 143) then Draws a white circle centered at (444, 139) with radius 48.
; PLAN: r0=162(x), r1=143(y), r2=114(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=139(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 143
LDI r2, 114
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 139
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
