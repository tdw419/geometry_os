; DESCRIPTION: Composite: Places a white line segment connecting (99, 128) to (351, 85) then Draws a white circle centered at (442, 128) with radius 10.
; PLAN: r0=99(x1), r1=128(y1), r2=351(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=128(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 128
LDI r2, 351
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 128
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
