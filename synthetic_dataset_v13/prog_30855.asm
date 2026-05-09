; DESCRIPTION: Composite: Creates a blue circular shape at (282, 107) with radius 69 then Places a purple 87x15 rectangle at position (282, 59).
; PLAN: r0=282(x), r1=107(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=59(y), r7=87(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 107
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 59
LDI r7, 87
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
