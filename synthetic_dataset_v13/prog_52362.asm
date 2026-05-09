; DESCRIPTION: Composite: Places a magenta 16x16 rectangle at position (193, 108) then Draws a purple circle centered at (189, 132) with radius 66.
; PLAN: r0=193(x), r1=108(y), r2=16(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=132(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 108
LDI r2, 16
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 132
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
