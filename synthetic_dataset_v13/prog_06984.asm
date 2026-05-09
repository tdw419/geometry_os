; DESCRIPTION: Composite: Creates a green rectangular region at (348, 150) spanning 112 by 53 pixels then Draws a blue circle centered at (249, 94) with radius 50 then Places a orange line segment connecting (113, 102) to (52, 167).
; PLAN: r0=348(x), r1=150(y), r2=112(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=94(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x1), r11=102(y1), r12=52(x2), r13=167(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 150
LDI r2, 112
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 94
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 102
LDI r12, 52
LDI r13, 167
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
