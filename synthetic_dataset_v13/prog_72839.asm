; DESCRIPTION: Composite: Creates a orange rectangular region at (288, 176) spanning 65 by 18 pixels then Draws a red circle centered at (53, 131) with radius 17.
; PLAN: r0=288(x), r1=176(y), r2=65(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=131(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 176
LDI r2, 65
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 131
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
