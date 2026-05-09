; DESCRIPTION: Composite: Renders a magenta disk with center (299, 155) and radius 54 then Sets a single red pixel at (314, 67) then Draws a magenta rectangle at (323, 41) with width 53 and height 87.
; PLAN: r0=299(x), r1=155(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=67(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=323(x), r11=41(y), r12=53(width), r13=87(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 155
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 67
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 323
LDI r11, 41
LDI r12, 53
LDI r13, 87
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
