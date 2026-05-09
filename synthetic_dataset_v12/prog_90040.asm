; DESCRIPTION: Composite: Creates a magenta circular shape at (160, 158) with radius 69 then Renders a red box of size 49x99 starting at (108, 7).
; PLAN: r0=160(x), r1=158(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=7(y), r7=49(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 158
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 7
LDI r7, 49
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
