; DESCRIPTION: Composite: Draws a green circle centered at (30, 186) with radius 12 then Renders a orange box of size 69x55 starting at (24, 162).
; PLAN: r0=30(x), r1=186(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=162(y), r7=69(width), r8=55(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 186
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 162
LDI r7, 69
LDI r8, 55
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
