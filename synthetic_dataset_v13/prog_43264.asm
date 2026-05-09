; DESCRIPTION: Composite: Draws a white circle centered at (266, 189) with radius 22 then Creates a black rectangular region at (406, 97) spanning 45 by 77 pixels.
; PLAN: r0=266(x), r1=189(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=97(y), r7=45(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 189
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 97
LDI r7, 45
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
