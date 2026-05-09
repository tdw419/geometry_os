; DESCRIPTION: Composite: Draws a purple circle centered at (485, 80) with radius 24 then Renders a orange box of size 55x95 starting at (7, 7).
; PLAN: r0=485(x), r1=80(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=7(y), r7=55(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 485
LDI r1, 80
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 7
LDI r7, 55
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
