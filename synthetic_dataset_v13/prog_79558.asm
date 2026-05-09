; DESCRIPTION: Composite: Places a black dot at position (111, 81) then Creates a magenta rectangular region at (287, 157) spanning 68 by 72 pixels then Creates a yellow circular shape at (293, 153) with radius 67.
; PLAN: r0=111(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=157(y), r7=68(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=153(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 157
LDI r7, 68
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 153
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
