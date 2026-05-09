; DESCRIPTION: Composite: Creates a cyan rectangular region at (375, 127) spanning 88 by 85 pixels then Draws a white circle centered at (328, 105) with radius 59.
; PLAN: r0=375(x), r1=127(y), r2=88(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=105(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 127
LDI r2, 88
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 105
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
