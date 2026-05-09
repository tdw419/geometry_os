; DESCRIPTION: Composite: Renders a orange box of size 111x114 starting at (37, 102) then Places a white circle of radius 50 at center (190, 81).
; PLAN: r0=37(x), r1=102(y), r2=111(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=81(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 102
LDI r2, 111
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 81
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
