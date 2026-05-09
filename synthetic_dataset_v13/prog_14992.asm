; DESCRIPTION: Composite: Draws a magenta circle centered at (415, 43) with radius 18 then Renders a black box of size 34x39 starting at (80, 167).
; PLAN: r0=415(x), r1=43(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=167(y), r7=34(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 43
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 167
LDI r7, 34
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
