; DESCRIPTION: Composite: Creates a orange rectangular region at (34, 49) spanning 63 by 54 pixels then Draws a blue circle centered at (57, 101) with radius 56.
; PLAN: r0=34(x), r1=49(y), r2=63(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=101(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 34
LDI r1, 49
LDI r2, 63
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 101
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
