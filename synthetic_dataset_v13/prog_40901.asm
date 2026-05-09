; DESCRIPTION: Composite: Creates a blue rectangular region at (62, 135) spanning 94 by 83 pixels then Places a yellow circle of radius 69 at center (210, 72).
; PLAN: r0=62(x), r1=135(y), r2=94(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=72(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 135
LDI r2, 94
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 72
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
