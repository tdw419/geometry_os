; DESCRIPTION: Composite: Creates a purple rectangular region at (440, 40) spanning 26 by 103 pixels then Draws a orange circle centered at (413, 140) with radius 72.
; PLAN: r0=440(x), r1=40(y), r2=26(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=140(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 40
LDI r2, 26
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 140
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
