; DESCRIPTION: Composite: Places a red circle of radius 24 at center (88, 123) then Draws a black rectangle at (443, 55) with width 49 and height 29.
; PLAN: r0=88(x), r1=123(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=55(y), r7=49(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 123
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 55
LDI r7, 49
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
