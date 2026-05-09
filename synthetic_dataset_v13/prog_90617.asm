; DESCRIPTION: Composite: Draws a magenta circle centered at (291, 137) with radius 22 then Renders a red box of size 77x102 starting at (414, 64).
; PLAN: r0=291(x), r1=137(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=64(y), r7=77(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 137
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 64
LDI r7, 77
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
