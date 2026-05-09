; DESCRIPTION: Composite: Places a purple 13x85 rectangle at position (368, 128) then Draws a purple circle centered at (69, 114) with radius 55.
; PLAN: r0=368(x), r1=128(y), r2=13(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=114(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 128
LDI r2, 13
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 114
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
