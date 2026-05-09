; DESCRIPTION: Composite: Creates a yellow circular shape at (116, 105) with radius 69 then Renders a purple box of size 19x37 starting at (239, 156).
; PLAN: r0=116(x), r1=105(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=156(y), r7=19(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 105
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 156
LDI r7, 19
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
