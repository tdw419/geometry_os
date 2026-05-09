; DESCRIPTION: Composite: Draws a red circle centered at (347, 184) with radius 52 then Places a white line segment connecting (137, 83) to (192, 24).
; PLAN: r0=347(x), r1=184(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x1), r6=83(y1), r7=192(x2), r8=24(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 184
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 83
LDI r7, 192
LDI r8, 24
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
