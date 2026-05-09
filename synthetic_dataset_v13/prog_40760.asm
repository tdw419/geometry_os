; DESCRIPTION: Composite: Draws a purple circle centered at (36, 33) with radius 20 then Renders a yellow box of size 32x91 starting at (351, 58).
; PLAN: r0=36(x), r1=33(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=58(y), r7=32(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 33
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 58
LDI r7, 32
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
