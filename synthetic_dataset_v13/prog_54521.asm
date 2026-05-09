; DESCRIPTION: Composite: Renders a green box of size 95x56 starting at (355, 76) then Draws a green circle centered at (203, 116) with radius 63.
; PLAN: r0=355(x), r1=76(y), r2=95(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=116(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 76
LDI r2, 95
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 116
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
