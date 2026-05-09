; DESCRIPTION: Composite: Creates a black rectangular region at (242, 163) spanning 88 by 67 pixels then Draws a yellow circle centered at (311, 102) with radius 22.
; PLAN: r0=242(x), r1=163(y), r2=88(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=102(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 163
LDI r2, 88
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 102
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
