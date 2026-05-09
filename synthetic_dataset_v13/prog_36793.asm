; DESCRIPTION: Composite: Draws a yellow circle centered at (218, 159) with radius 67 then Places a magenta 93x102 rectangle at position (45, 105).
; PLAN: r0=218(x), r1=159(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=105(y), r7=93(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 159
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 105
LDI r7, 93
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
