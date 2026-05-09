; DESCRIPTION: Composite: Places a white line segment connecting (100, 113) to (397, 240) then Creates a magenta rectangular region at (31, 48) spanning 69 by 66 pixels then Places a purple circle of radius 50 at center (265, 160).
; PLAN: r0=100(x1), r1=113(y1), r2=397(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=48(y), r7=69(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=160(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 113
LDI r2, 397
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 48
LDI r7, 69
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 160
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
