; DESCRIPTION: Composite: Draws a black circle centered at (50, 84) with radius 17 then Creates a orange rectangular region at (271, 23) spanning 98 by 34 pixels.
; PLAN: r0=50(x), r1=84(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=23(y), r7=98(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 84
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 23
LDI r7, 98
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
