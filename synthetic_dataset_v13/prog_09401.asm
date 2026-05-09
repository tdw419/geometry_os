; DESCRIPTION: Composite: Creates a red circular shape at (88, 85) with radius 73 then Renders a red box of size 63x72 starting at (62, 105).
; PLAN: r0=88(x), r1=85(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=105(y), r7=63(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 85
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 105
LDI r7, 63
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
