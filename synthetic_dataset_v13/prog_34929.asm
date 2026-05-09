; DESCRIPTION: Composite: Creates a green rectangular region at (140, 43) spanning 94 by 21 pixels then Creates a magenta circular shape at (400, 164) with radius 78.
; PLAN: r0=140(x), r1=43(y), r2=94(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=164(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 43
LDI r2, 94
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 164
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
