; DESCRIPTION: Composite: Places a green line segment connecting (113, 132) to (260, 81) then Places a red circle of radius 45 at center (427, 208) then Creates a red rectangular region at (344, 35) spanning 73 by 72 pixels.
; PLAN: r0=113(x1), r1=132(y1), r2=260(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=208(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=35(y), r12=73(width), r13=72(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 132
LDI r2, 260
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 208
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 35
LDI r12, 73
LDI r13, 72
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
