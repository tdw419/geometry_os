; DESCRIPTION: Composite: Creates a yellow rectangular region at (187, 72) spanning 29 by 69 pixels then Creates a white circular shape at (187, 91) with radius 72.
; PLAN: r0=187(x), r1=72(y), r2=29(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=91(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 72
LDI r2, 29
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 91
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
