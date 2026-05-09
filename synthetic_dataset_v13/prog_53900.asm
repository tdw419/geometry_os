; DESCRIPTION: Composite: Creates a orange rectangular region at (376, 0) spanning 54 by 56 pixels then Draws a red circle centered at (487, 225) with radius 15.
; PLAN: r0=376(x), r1=0(y), r2=54(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=225(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 0
LDI r2, 54
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 225
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
