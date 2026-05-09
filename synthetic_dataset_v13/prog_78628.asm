; DESCRIPTION: Composite: Draws a orange circle centered at (370, 138) with radius 62 then Creates a purple rectangular region at (94, 233) spanning 58 by 10 pixels.
; PLAN: r0=370(x), r1=138(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=233(y), r7=58(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 138
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 233
LDI r7, 58
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
