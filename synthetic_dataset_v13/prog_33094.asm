; DESCRIPTION: Composite: Creates a green rectangular region at (22, 198) spanning 10 by 56 pixels then Renders a black disk with center (428, 175) and radius 15.
; PLAN: r0=22(x), r1=198(y), r2=10(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=175(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 198
LDI r2, 10
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 175
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
