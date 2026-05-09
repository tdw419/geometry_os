; DESCRIPTION: Composite: Sets a single white pixel at (289, 93) then Renders a white box of size 44x34 starting at (284, 48) then Creates a blue circular shape at (353, 122) with radius 73.
; PLAN: r0=289(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=48(y), r7=44(width), r8=34(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x), r11=122(y), r12=73(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 48
LDI r7, 44
LDI r8, 34
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 122
LDI r12, 73
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
