; DESCRIPTION: Composite: Draws a red circle centered at (444, 183) with radius 60 then Creates a magenta rectangular region at (219, 137) spanning 10 by 72 pixels.
; PLAN: r0=444(x), r1=183(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=137(y), r7=10(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 183
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 137
LDI r7, 10
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
