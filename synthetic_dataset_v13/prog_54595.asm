; DESCRIPTION: Composite: Renders a orange box of size 106x97 starting at (17, 34) then Draws a white circle centered at (385, 133) with radius 12.
; PLAN: r0=17(x), r1=34(y), r2=106(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=133(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 34
LDI r2, 106
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 133
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
