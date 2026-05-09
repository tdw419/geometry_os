; DESCRIPTION: Composite: Creates a green circular shape at (222, 150) with radius 78 then Renders a purple box of size 58x97 starting at (129, 20).
; PLAN: r0=222(x), r1=150(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=20(y), r7=58(width), r8=97(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 150
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 20
LDI r7, 58
LDI r8, 97
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
