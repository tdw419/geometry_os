; DESCRIPTION: Composite: Creates a red rectangular region at (383, 85) spanning 45 by 94 pixels then Draws a blue circle centered at (145, 43) with radius 33.
; PLAN: r0=383(x), r1=85(y), r2=45(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=43(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 85
LDI r2, 45
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 43
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
