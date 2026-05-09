; DESCRIPTION: Composite: Sets a single black pixel at (214, 160) then Renders a white box of size 80x60 starting at (334, 171) then Draws a black circle centered at (338, 154) with radius 67.
; PLAN: r0=214(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=171(y), r7=80(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=154(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 334
LDI r6, 171
LDI r7, 80
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 154
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
