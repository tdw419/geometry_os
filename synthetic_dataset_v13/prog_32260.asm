; DESCRIPTION: Composite: Renders a red disk with center (384, 98) and radius 58 then Creates a magenta rectangular region at (37, 19) spanning 111 by 119 pixels then Places a red line segment connecting (375, 140) to (402, 224).
; PLAN: r0=384(x), r1=98(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=19(y), r7=111(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x1), r11=140(y1), r12=402(x2), r13=224(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 98
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 19
LDI r7, 111
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 140
LDI r12, 402
LDI r13, 224
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
