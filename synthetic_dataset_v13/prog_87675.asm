; DESCRIPTION: Composite: Draws a black circle centered at (143, 116) with radius 18 then Creates a green rectangular region at (282, 112) spanning 70 by 23 pixels.
; PLAN: r0=143(x), r1=116(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=112(y), r7=70(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 116
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 112
LDI r7, 70
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
