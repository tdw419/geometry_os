; DESCRIPTION: Composite: Creates a black rectangular region at (484, 188) spanning 16 by 25 pixels then Draws a yellow circle centered at (234, 171) with radius 46.
; PLAN: r0=484(x), r1=188(y), r2=16(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=171(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 188
LDI r2, 16
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 171
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
