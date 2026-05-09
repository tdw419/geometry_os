; DESCRIPTION: Composite: Places a red circle of radius 34 at center (250, 203) then Creates a purple rectangular region at (196, 29) spanning 64 by 19 pixels then Places a yellow line segment connecting (384, 128) to (425, 173).
; PLAN: r0=250(x), r1=203(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=29(y), r7=64(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x1), r11=128(y1), r12=425(x2), r13=173(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 203
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 29
LDI r7, 64
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 128
LDI r12, 425
LDI r13, 173
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
