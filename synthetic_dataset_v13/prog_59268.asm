; DESCRIPTION: Composite: Draws a blue circle centered at (295, 168) with radius 39 then Draws a green rectangle at (55, 136) with width 88 and height 10.
; PLAN: r0=295(x), r1=168(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=136(y), r7=88(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 168
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 136
LDI r7, 88
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
