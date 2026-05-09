; DESCRIPTION: Composite: Creates a black rectangular region at (281, 161) spanning 69 by 47 pixels then Draws a yellow circle centered at (165, 66) with radius 24.
; PLAN: r0=281(x), r1=161(y), r2=69(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=66(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 161
LDI r2, 69
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 66
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
