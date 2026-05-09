; DESCRIPTION: Composite: Places a magenta circle of radius 15 at center (436, 138) then Places a purple dot at position (279, 101) then Creates a green rectangular region at (152, 119) spanning 113 by 49 pixels.
; PLAN: r0=436(x), r1=138(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=101(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=119(y), r12=113(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 138
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 101
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 152
LDI r11, 119
LDI r12, 113
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
