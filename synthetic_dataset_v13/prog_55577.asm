; DESCRIPTION: Composite: Draws a orange circle centered at (353, 210) with radius 16 then Creates a purple rectangular region at (40, 4) spanning 19 by 68 pixels.
; PLAN: r0=353(x), r1=210(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=4(y), r7=19(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 210
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 4
LDI r7, 19
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
