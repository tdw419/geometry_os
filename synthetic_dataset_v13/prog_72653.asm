; DESCRIPTION: Composite: Renders a white disk with center (348, 168) and radius 38 then Draws a yellow rectangle at (368, 8) with width 111 and height 116.
; PLAN: r0=348(x), r1=168(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=8(y), r7=111(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 168
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 8
LDI r7, 111
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
