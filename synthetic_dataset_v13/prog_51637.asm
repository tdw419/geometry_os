; DESCRIPTION: Composite: Renders a green box of size 77x29 starting at (171, 2) then Draws a purple circle centered at (182, 95) with radius 59.
; PLAN: r0=171(x), r1=2(y), r2=77(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=95(y), r7=59(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 2
LDI r2, 77
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 95
LDI r7, 59
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
