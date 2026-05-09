; DESCRIPTION: Composite: Draws a black rectangle at (6, 24) with width 64 and height 51 then Renders a green disk with center (204, 53) and radius 47.
; PLAN: r0=6(x), r1=24(y), r2=64(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=53(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 24
LDI r2, 64
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 53
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
