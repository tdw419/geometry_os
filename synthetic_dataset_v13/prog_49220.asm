; DESCRIPTION: Composite: Draws a yellow circle centered at (155, 210) with radius 21 then Renders a yellow box of size 94x55 starting at (101, 155).
; PLAN: r0=155(x), r1=210(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=155(y), r7=94(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 210
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 155
LDI r7, 94
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
