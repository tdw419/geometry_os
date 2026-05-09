; DESCRIPTION: Composite: Draws a blue circle centered at (81, 49) with radius 36 then Renders a yellow box of size 109x59 starting at (340, 184).
; PLAN: r0=81(x), r1=49(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=184(y), r7=109(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 49
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 184
LDI r7, 109
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
