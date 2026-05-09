; DESCRIPTION: Composite: Places a green dot at position (274, 214) then Renders a yellow box of size 72x35 starting at (322, 167) then Creates a white circular shape at (207, 27) with radius 23.
; PLAN: r0=274(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=167(y), r7=72(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=27(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 322
LDI r6, 167
LDI r7, 72
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 27
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
