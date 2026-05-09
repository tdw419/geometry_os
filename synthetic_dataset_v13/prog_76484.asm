; DESCRIPTION: Composite: Renders a magenta disk with center (351, 191) and radius 44 then Creates a magenta rectangular region at (261, 1) spanning 107 by 95 pixels.
; PLAN: r0=351(x), r1=191(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=1(y), r7=107(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 191
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 1
LDI r7, 107
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
