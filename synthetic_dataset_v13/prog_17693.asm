; DESCRIPTION: Composite: Sets a single black pixel at (72, 177) then Renders a white box of size 82x103 starting at (314, 9) then Renders a black disk with center (244, 165) and radius 69.
; PLAN: r0=72(x), r1=177(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=9(y), r7=82(width), r8=103(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=165(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 177
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 9
LDI r7, 82
LDI r8, 103
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 165
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
