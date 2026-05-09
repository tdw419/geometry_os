; DESCRIPTION: Composite: Draws a white circle centered at (58, 80) with radius 29 then Creates a blue rectangular region at (409, 118) spanning 13 by 46 pixels.
; PLAN: r0=58(x), r1=80(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=118(y), r7=13(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 80
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 118
LDI r7, 13
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
