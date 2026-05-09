; DESCRIPTION: Composite: Creates a blue circular shape at (153, 133) with radius 69 then Places a green 120x49 rectangle at position (19, 87).
; PLAN: r0=153(x), r1=133(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=87(y), r7=120(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 133
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 87
LDI r7, 120
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
