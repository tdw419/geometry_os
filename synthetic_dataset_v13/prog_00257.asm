; DESCRIPTION: Composite: Places a red line segment connecting (353, 172) to (374, 180) then Renders a purple disk with center (282, 118) and radius 61 then Renders a magenta box of size 49x101 starting at (397, 106).
; PLAN: r0=353(x1), r1=172(y1), r2=374(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=118(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x), r11=106(y), r12=49(width), r13=101(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 172
LDI r2, 374
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 118
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 106
LDI r12, 49
LDI r13, 101
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
