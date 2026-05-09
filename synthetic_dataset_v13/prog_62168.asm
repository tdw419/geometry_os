; DESCRIPTION: Composite: Draws a yellow circle centered at (458, 55) with radius 33 then Renders a blue box of size 16x10 starting at (482, 110).
; PLAN: r0=458(x), r1=55(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=110(y), r7=16(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 55
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 110
LDI r7, 16
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
