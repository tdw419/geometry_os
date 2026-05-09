; DESCRIPTION: Composite: Places a yellow circle of radius 43 at center (77, 78) then Creates a white rectangular region at (456, 108) spanning 37 by 105 pixels.
; PLAN: r0=77(x), r1=78(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=108(y), r7=37(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 78
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 108
LDI r7, 37
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
