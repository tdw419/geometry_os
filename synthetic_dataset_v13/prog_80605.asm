; DESCRIPTION: Composite: Places a purple circle of radius 69 at center (144, 93) then Places a magenta 114x81 rectangle at position (285, 163).
; PLAN: r0=144(x), r1=93(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=163(y), r7=114(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 93
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 163
LDI r7, 114
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
