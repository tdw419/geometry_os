; DESCRIPTION: Composite: Renders a black disk with center (10, 43) and radius 10 then Creates a orange rectangular region at (54, 16) spanning 53 by 118 pixels.
; PLAN: r0=10(x), r1=43(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=16(y), r7=53(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 43
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 16
LDI r7, 53
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
