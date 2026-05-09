; DESCRIPTION: Composite: Places a blue circle of radius 74 at center (421, 140) then Creates a purple rectangular region at (95, 128) spanning 79 by 81 pixels then Places a cyan line segment connecting (246, 224) to (272, 73).
; PLAN: r0=421(x), r1=140(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=128(y), r7=79(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x1), r11=224(y1), r12=272(x2), r13=73(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 140
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 128
LDI r7, 79
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 224
LDI r12, 272
LDI r13, 73
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
