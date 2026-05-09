; DESCRIPTION: Composite: Renders a blue box of size 36x11 starting at (322, 77) then Creates a orange circular shape at (263, 137) with radius 78.
; PLAN: r0=322(x), r1=77(y), r2=36(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=137(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 77
LDI r2, 36
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 137
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
