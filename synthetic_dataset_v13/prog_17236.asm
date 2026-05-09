; DESCRIPTION: Composite: Places a magenta 63x44 rectangle at position (108, 53) then Creates a magenta circular shape at (475, 81) with radius 11.
; PLAN: r0=108(x), r1=53(y), r2=63(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=81(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 53
LDI r2, 63
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 81
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
