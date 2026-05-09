; DESCRIPTION: Composite: Creates a orange rectangular region at (428, 157) spanning 38 by 37 pixels then Renders a black disk with center (291, 156) and radius 52.
; PLAN: r0=428(x), r1=157(y), r2=38(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=156(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 157
LDI r2, 38
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 156
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
