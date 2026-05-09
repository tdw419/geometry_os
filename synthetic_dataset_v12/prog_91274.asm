; DESCRIPTION: Composite: Creates a white circular shape at (385, 57) with radius 52 then Places a yellow line segment connecting (501, 167) to (208, 4).
; PLAN: r0=385(x), r1=57(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x1), r6=167(y1), r7=208(x2), r8=4(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 57
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 167
LDI r7, 208
LDI r8, 4
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
