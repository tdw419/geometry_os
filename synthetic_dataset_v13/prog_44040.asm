; DESCRIPTION: Composite: Creates a blue rectangular region at (69, 45) spanning 20 by 108 pixels then Draws a blue circle centered at (129, 155) with radius 80.
; PLAN: r0=69(x), r1=45(y), r2=20(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=155(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 45
LDI r2, 20
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 155
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
