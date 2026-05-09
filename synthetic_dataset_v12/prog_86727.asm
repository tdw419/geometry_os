; DESCRIPTION: Composite: Renders a red box of size 63x32 starting at (241, 161) then Creates a black circular shape at (419, 110) with radius 62.
; PLAN: r0=241(x), r1=161(y), r2=63(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=110(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 241
LDI r1, 161
LDI r2, 63
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 110
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
