; DESCRIPTION: Composite: Places a magenta 33x33 rectangle at position (260, 79) then Draws a purple circle centered at (26, 146) with radius 23.
; PLAN: r0=260(x), r1=79(y), r2=33(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=146(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 79
LDI r2, 33
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 146
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
