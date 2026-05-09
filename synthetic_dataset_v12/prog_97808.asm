; DESCRIPTION: Composite: Renders a magenta disk with center (163, 173) and radius 32 then Creates a red rectangular region at (54, 70) spanning 119 by 45 pixels then Renders a yellow line between points (119, 252) and (399, 231).
; PLAN: r0=163(x), r1=173(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=70(y), r7=119(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x1), r11=252(y1), r12=399(x2), r13=231(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 173
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 70
LDI r7, 119
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 252
LDI r12, 399
LDI r13, 231
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
