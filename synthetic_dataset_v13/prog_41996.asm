; DESCRIPTION: Composite: Renders a red disk with center (205, 170) and radius 71 then Creates a magenta rectangular region at (316, 13) spanning 100 by 24 pixels.
; PLAN: r0=205(x), r1=170(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=13(y), r7=100(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 170
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 13
LDI r7, 100
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
