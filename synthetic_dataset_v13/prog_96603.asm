; DESCRIPTION: Composite: Creates a orange rectangular region at (234, 17) spanning 54 by 20 pixels then Draws a green circle centered at (98, 95) with radius 26.
; PLAN: r0=234(x), r1=17(y), r2=54(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=95(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 234
LDI r1, 17
LDI r2, 54
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 95
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
