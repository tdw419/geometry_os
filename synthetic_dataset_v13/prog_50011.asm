; DESCRIPTION: Composite: Places a cyan 108x81 rectangle at position (354, 94) then Draws a purple circle centered at (138, 162) with radius 66.
; PLAN: r0=354(x), r1=94(y), r2=108(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=162(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 94
LDI r2, 108
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 162
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
