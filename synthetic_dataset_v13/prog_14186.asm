; DESCRIPTION: Composite: Creates a blue rectangular region at (148, 178) spanning 115 by 70 pixels then Creates a blue circular shape at (321, 135) with radius 16.
; PLAN: r0=148(x), r1=178(y), r2=115(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=135(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 178
LDI r2, 115
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 135
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
