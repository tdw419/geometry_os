; DESCRIPTION: Composite: Places a magenta 106x47 rectangle at position (62, 16) then Draws a purple circle centered at (91, 148) with radius 71.
; PLAN: r0=62(x), r1=16(y), r2=106(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=148(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 16
LDI r2, 106
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 148
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
