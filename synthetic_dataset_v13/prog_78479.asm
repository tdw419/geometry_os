; DESCRIPTION: Composite: Renders a orange box of size 76x97 starting at (15, 107) then Draws a white circle centered at (248, 100) with radius 13.
; PLAN: r0=15(x), r1=107(y), r2=76(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=100(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 107
LDI r2, 76
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 100
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
