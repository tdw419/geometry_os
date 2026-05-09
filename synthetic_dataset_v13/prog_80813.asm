; DESCRIPTION: Composite: Draws a white circle centered at (206, 118) with radius 58 then Creates a white rectangular region at (74, 9) spanning 45 by 24 pixels.
; PLAN: r0=206(x), r1=118(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=9(y), r7=45(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 118
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 9
LDI r7, 45
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
