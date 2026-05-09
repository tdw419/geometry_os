; DESCRIPTION: Composite: Renders a blue box of size 19x113 starting at (332, 139) then Creates a red circular shape at (356, 118) with radius 52.
; PLAN: r0=332(x), r1=139(y), r2=19(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=118(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 139
LDI r2, 19
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 118
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
