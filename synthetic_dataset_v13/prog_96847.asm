; DESCRIPTION: Composite: Renders a red box of size 55x58 starting at (416, 172) then Draws a blue circle centered at (210, 101) with radius 76.
; PLAN: r0=416(x), r1=172(y), r2=55(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=101(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 172
LDI r2, 55
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 101
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
