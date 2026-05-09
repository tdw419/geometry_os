; DESCRIPTION: Composite: Places a green dot at position (253, 182) then Creates a magenta rectangular region at (238, 200) spanning 67 by 41 pixels then Creates a blue circular shape at (114, 62) with radius 14.
; PLAN: r0=253(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=200(y), r7=67(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=62(y), r12=14(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 238
LDI r6, 200
LDI r7, 67
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 62
LDI r12, 14
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
