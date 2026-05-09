; DESCRIPTION: Composite: Places a black circle of radius 17 at center (406, 17) then Draws a orange rectangle at (122, 105) with width 77 and height 46.
; PLAN: r0=406(x), r1=17(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=105(y), r7=77(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 17
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 105
LDI r7, 77
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
