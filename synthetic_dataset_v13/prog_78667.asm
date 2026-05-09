; DESCRIPTION: Composite: Creates a blue rectangular region at (341, 13) spanning 87 by 100 pixels then Renders a blue disk with center (388, 195) and radius 23.
; PLAN: r0=341(x), r1=13(y), r2=87(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=195(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 13
LDI r2, 87
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 195
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
