; DESCRIPTION: Composite: Creates a orange rectangular region at (411, 144) spanning 58 by 82 pixels then Draws a orange circle centered at (278, 48) with radius 37.
; PLAN: r0=411(x), r1=144(y), r2=58(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=48(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 144
LDI r2, 58
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 48
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
