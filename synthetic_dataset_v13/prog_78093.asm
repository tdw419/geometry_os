; DESCRIPTION: Composite: Renders a magenta disk with center (366, 123) and radius 17 then Creates a orange rectangular region at (414, 10) spanning 41 by 77 pixels.
; PLAN: r0=366(x), r1=123(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=10(y), r7=41(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 123
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 10
LDI r7, 41
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
