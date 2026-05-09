; DESCRIPTION: Composite: Places a magenta line segment connecting (8, 61) to (364, 209) then Places a magenta 69x105 rectangle at position (214, 135) then Creates a green circular shape at (282, 84) with radius 73.
; PLAN: r0=8(x1), r1=61(y1), r2=364(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=135(y), r7=69(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=84(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 61
LDI r2, 364
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 135
LDI r7, 69
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 84
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
