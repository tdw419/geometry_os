; DESCRIPTION: Composite: Renders a yellow box of size 77x72 starting at (224, 26) then Creates a black circular shape at (283, 216) with radius 25.
; PLAN: r0=224(x), r1=26(y), r2=77(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=216(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 26
LDI r2, 77
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 216
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
