; DESCRIPTION: Composite: Renders a blue box of size 17x55 starting at (113, 32) then Places a white line segment connecting (132, 141) to (257, 157) then Creates a white circular shape at (51, 225) with radius 10.
; PLAN: r0=113(x), r1=32(y), r2=17(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=141(y1), r7=257(x2), r8=157(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=225(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 32
LDI r2, 17
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 141
LDI r7, 257
LDI r8, 157
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 225
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
