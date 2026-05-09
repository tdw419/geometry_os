; DESCRIPTION: Composite: Places a white line segment connecting (348, 178) to (192, 34) then Draws a black circle centered at (249, 143) with radius 20.
; PLAN: r0=348(x1), r1=178(y1), r2=192(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=143(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 178
LDI r2, 192
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 143
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
