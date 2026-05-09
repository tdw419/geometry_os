; DESCRIPTION: Composite: Creates a orange rectangular region at (176, 98) spanning 38 by 93 pixels then Draws a black circle centered at (123, 95) with radius 67.
; PLAN: r0=176(x), r1=98(y), r2=38(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=95(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 98
LDI r2, 38
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 95
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
