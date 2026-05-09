; DESCRIPTION: Composite: Sets a single yellow pixel at (134, 85) then Places a blue 10x87 rectangle at position (354, 40) then Draws a purple circle centered at (102, 81) with radius 28.
; PLAN: r0=134(x), r1=85(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=40(y), r7=10(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=81(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 85
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 354
LDI r6, 40
LDI r7, 10
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 81
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
