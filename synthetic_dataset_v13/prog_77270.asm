; DESCRIPTION: Composite: Places a black line segment connecting (189, 50) to (20, 207) then Creates a purple circular shape at (224, 178) with radius 43.
; PLAN: r0=189(x1), r1=50(y1), r2=20(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=178(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 50
LDI r2, 20
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 178
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
