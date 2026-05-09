; DESCRIPTION: Composite: Sets a single yellow pixel at (207, 99) then Creates a yellow rectangular region at (263, 37) spanning 73 by 67 pixels then Places a magenta circle of radius 35 at center (414, 47).
; PLAN: r0=207(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=37(y), r7=73(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=47(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 263
LDI r6, 37
LDI r7, 73
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 47
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
