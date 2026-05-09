; DESCRIPTION: Composite: Renders a magenta disk with center (397, 23) and radius 19 then Draws a green rectangle at (104, 107) with width 119 and height 119 then Renders a yellow line between points (336, 119) and (294, 84).
; PLAN: r0=397(x), r1=23(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=107(y), r7=119(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x1), r11=119(y1), r12=294(x2), r13=84(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 23
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 107
LDI r7, 119
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 119
LDI r12, 294
LDI r13, 84
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
