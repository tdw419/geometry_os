; DESCRIPTION: Composite: Draws a black rectangle at (420, 116) with width 78 and height 58 then Renders a cyan disk with center (271, 76) and radius 62.
; PLAN: r0=420(x), r1=116(y), r2=78(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=76(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 116
LDI r2, 78
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 76
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
