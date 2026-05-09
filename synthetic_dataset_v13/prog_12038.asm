; DESCRIPTION: Composite: Creates a black rectangular region at (158, 149) spanning 23 by 70 pixels then Places a black circle of radius 62 at center (310, 75) then Places a white line segment connecting (408, 228) to (472, 32).
; PLAN: r0=158(x), r1=149(y), r2=23(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=75(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x1), r11=228(y1), r12=472(x2), r13=32(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 149
LDI r2, 23
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 75
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 228
LDI r12, 472
LDI r13, 32
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
