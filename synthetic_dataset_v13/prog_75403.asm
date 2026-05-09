; DESCRIPTION: Composite: Renders a red box of size 118x45 starting at (152, 1) then Creates a purple circular shape at (109, 88) with radius 31.
; PLAN: r0=152(x), r1=1(y), r2=118(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=88(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 1
LDI r2, 118
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 88
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
