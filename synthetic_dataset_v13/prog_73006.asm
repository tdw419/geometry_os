; DESCRIPTION: Composite: Draws a yellow circle centered at (295, 80) with radius 52 then Creates a magenta rectangular region at (141, 123) spanning 54 by 105 pixels.
; PLAN: r0=295(x), r1=80(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=123(y), r7=54(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 80
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 123
LDI r7, 54
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
