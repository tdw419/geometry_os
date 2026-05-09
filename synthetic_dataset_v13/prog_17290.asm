; DESCRIPTION: Composite: Creates a purple circular shape at (226, 116) with radius 26 then Renders a magenta box of size 43x11 starting at (402, 70).
; PLAN: r0=226(x), r1=116(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=70(y), r7=43(width), r8=11(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 116
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 70
LDI r7, 43
LDI r8, 11
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
