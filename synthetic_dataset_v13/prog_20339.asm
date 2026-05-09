; DESCRIPTION: Composite: Creates a black rectangular region at (160, 156) spanning 65 by 45 pixels then Renders a blue disk with center (95, 163) and radius 22.
; PLAN: r0=160(x), r1=156(y), r2=65(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=163(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 160
LDI r1, 156
LDI r2, 65
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 163
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
