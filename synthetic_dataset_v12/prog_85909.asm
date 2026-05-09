; DESCRIPTION: Composite: Renders a orange box of size 24x71 starting at (156, 43) then Creates a blue circular shape at (352, 182) with radius 64.
; PLAN: r0=156(x), r1=43(y), r2=24(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=182(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 43
LDI r2, 24
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 182
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
