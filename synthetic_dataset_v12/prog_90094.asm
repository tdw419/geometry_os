; DESCRIPTION: Composite: Renders a black line between points (414, 157) and (86, 236) then Places a magenta circle of radius 30 at center (100, 172) then Renders a white box of size 93x55 starting at (90, 38).
; PLAN: r0=414(x1), r1=157(y1), r2=86(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=172(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=38(y), r12=93(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 157
LDI r2, 86
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 172
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 38
LDI r12, 93
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
