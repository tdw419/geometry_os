; DESCRIPTION: Composite: Sets a single blue pixel at (412, 88) then Renders a red box of size 17x49 starting at (181, 5) then Creates a magenta circular shape at (426, 130) with radius 47.
; PLAN: r0=412(x), r1=88(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=5(y), r7=17(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=130(y), r12=47(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 88
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 5
LDI r7, 17
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 130
LDI r12, 47
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
