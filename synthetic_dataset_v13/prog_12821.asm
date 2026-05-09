; DESCRIPTION: Composite: Draws a yellow circle centered at (191, 83) with radius 62 then Creates a red rectangular region at (171, 66) spanning 40 by 61 pixels.
; PLAN: r0=191(x), r1=83(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=66(y), r7=40(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 83
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 66
LDI r7, 40
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
