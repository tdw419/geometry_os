; DESCRIPTION: Composite: Draws a purple circle centered at (270, 106) with radius 38 then Draws a white rectangle at (456, 53) with width 53 and height 43.
; PLAN: r0=270(x), r1=106(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=53(y), r7=53(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 106
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 53
LDI r7, 53
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
