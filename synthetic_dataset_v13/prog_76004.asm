; DESCRIPTION: Composite: Places a red line segment connecting (56, 153) to (153, 111) then Sets a single white pixel at (199, 12) then Draws a blue rectangle at (158, 183) with width 62 and height 55.
; PLAN: r0=56(x1), r1=153(y1), r2=153(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=12(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=183(y), r12=62(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 153
LDI r2, 153
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 12
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 183
LDI r12, 62
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
