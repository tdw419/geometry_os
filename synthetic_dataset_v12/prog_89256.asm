; DESCRIPTION: Composite: Creates a blue rectangular region at (110, 78) spanning 40 by 93 pixels then Draws a yellow circle centered at (80, 211) with radius 22.
; PLAN: r0=110(x), r1=78(y), r2=40(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=211(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 78
LDI r2, 40
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 211
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
