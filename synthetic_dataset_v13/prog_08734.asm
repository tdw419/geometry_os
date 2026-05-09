; DESCRIPTION: Composite: Creates a green circular shape at (436, 186) with radius 26 then Places a white line segment connecting (259, 10) to (407, 74).
; PLAN: r0=436(x), r1=186(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x1), r6=10(y1), r7=407(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 186
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 10
LDI r7, 407
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
