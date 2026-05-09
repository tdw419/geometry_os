; DESCRIPTION: Composite: Creates a magenta rectangular region at (289, 159) spanning 18 by 71 pixels then Renders a red disk with center (381, 126) and radius 55.
; PLAN: r0=289(x), r1=159(y), r2=18(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=126(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 159
LDI r2, 18
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 126
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
