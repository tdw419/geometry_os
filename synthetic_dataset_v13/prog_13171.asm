; DESCRIPTION: Composite: Creates a black rectangular region at (77, 90) spanning 107 by 107 pixels then Draws a orange circle centered at (335, 59) with radius 36.
; PLAN: r0=77(x), r1=90(y), r2=107(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=59(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 90
LDI r2, 107
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 59
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
