; DESCRIPTION: Composite: Creates a orange rectangular region at (138, 145) spanning 113 by 70 pixels then Draws a yellow circle centered at (200, 74) with radius 13.
; PLAN: r0=138(x), r1=145(y), r2=113(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=74(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 145
LDI r2, 113
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 74
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
