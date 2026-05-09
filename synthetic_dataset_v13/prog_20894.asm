; DESCRIPTION: Composite: Creates a red rectangular region at (181, 123) spanning 63 by 117 pixels then Renders a black disk with center (73, 48) and radius 15.
; PLAN: r0=181(x), r1=123(y), r2=63(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=48(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 123
LDI r2, 63
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 48
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
