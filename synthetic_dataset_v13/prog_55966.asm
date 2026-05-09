; DESCRIPTION: Composite: Creates a yellow rectangular region at (478, 79) spanning 25 by 93 pixels then Renders a black disk with center (265, 176) and radius 54.
; PLAN: r0=478(x), r1=79(y), r2=25(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=176(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 79
LDI r2, 25
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 176
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
