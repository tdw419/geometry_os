; DESCRIPTION: Composite: Places a blue line segment connecting (265, 3) to (246, 138) then Creates a white circular shape at (338, 50) with radius 49 then Places a magenta 44x82 rectangle at position (0, 100).
; PLAN: r0=265(x1), r1=3(y1), r2=246(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=50(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=100(y), r12=44(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 3
LDI r2, 246
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 50
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 100
LDI r12, 44
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
