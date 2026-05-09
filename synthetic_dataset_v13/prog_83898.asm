; DESCRIPTION: Composite: Renders a blue box of size 71x101 starting at (258, 34) then Places a magenta circle of radius 12 at center (310, 238).
; PLAN: r0=258(x), r1=34(y), r2=71(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=238(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 34
LDI r2, 71
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 238
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
