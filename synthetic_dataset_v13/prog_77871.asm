; DESCRIPTION: Composite: Renders a orange box of size 119x50 starting at (81, 94) then Places a magenta circle of radius 71 at center (129, 100).
; PLAN: r0=81(x), r1=94(y), r2=119(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=100(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 94
LDI r2, 119
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 100
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
