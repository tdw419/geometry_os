; DESCRIPTION: Composite: Creates a black rectangular region at (165, 174) spanning 38 by 16 pixels then Draws a orange circle centered at (281, 89) with radius 72.
; PLAN: r0=165(x), r1=174(y), r2=38(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=89(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 174
LDI r2, 38
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 89
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
