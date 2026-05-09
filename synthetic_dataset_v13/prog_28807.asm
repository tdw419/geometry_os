; DESCRIPTION: Composite: Sets a single white pixel at (154, 30) then Places a magenta 103x22 rectangle at position (309, 122) then Creates a blue circular shape at (436, 170) with radius 46.
; PLAN: r0=154(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=122(y), r7=103(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=170(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 122
LDI r7, 103
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 170
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
