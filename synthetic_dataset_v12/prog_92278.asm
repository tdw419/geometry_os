; DESCRIPTION: Composite: Renders a blue box of size 100x57 starting at (136, 85) then Renders a white line between points (239, 89) and (148, 183) then Renders a magenta disk with center (360, 128) and radius 25.
; PLAN: r0=136(x), r1=85(y), r2=100(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=89(y1), r7=148(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=128(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 85
LDI r2, 100
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 89
LDI r7, 148
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 128
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
