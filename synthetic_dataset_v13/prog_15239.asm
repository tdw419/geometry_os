; DESCRIPTION: Composite: Creates a blue rectangular region at (181, 87) spanning 76 by 103 pixels then Draws a black circle centered at (346, 164) with radius 44.
; PLAN: r0=181(x), r1=87(y), r2=76(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=164(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 87
LDI r2, 76
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 164
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
