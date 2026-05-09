; DESCRIPTION: Composite: Renders a black box of size 38x111 starting at (426, 20) then Draws a orange circle centered at (71, 121) with radius 49.
; PLAN: r0=426(x), r1=20(y), r2=38(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=121(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 20
LDI r2, 38
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 121
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
