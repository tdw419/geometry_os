; DESCRIPTION: Composite: Creates a magenta circular shape at (20, 201) with radius 15 then Renders a yellow box of size 84x13 starting at (122, 192).
; PLAN: r0=20(x), r1=201(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=192(y), r7=84(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 201
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 192
LDI r7, 84
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
