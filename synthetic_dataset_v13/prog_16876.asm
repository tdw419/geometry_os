; DESCRIPTION: Composite: Draws a yellow rectangle at (173, 78) with width 44 and height 69 then Renders a yellow disk with center (169, 172) and radius 47.
; PLAN: r0=173(x), r1=78(y), r2=44(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=172(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 78
LDI r2, 44
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 172
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
