; DESCRIPTION: Composite: Creates a magenta circular shape at (336, 121) with radius 25 then Places a green line segment connecting (323, 92) to (461, 13) then Creates a green rectangular region at (397, 189) spanning 67 by 33 pixels.
; PLAN: r0=336(x), r1=121(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x1), r6=92(y1), r7=461(x2), r8=13(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=189(y), r12=67(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 121
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 92
LDI r7, 461
LDI r8, 13
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 189
LDI r12, 67
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
