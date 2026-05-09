; DESCRIPTION: Composite: Creates a black circular shape at (328, 158) with radius 61 then Places a cyan line segment connecting (381, 83) to (33, 218).
; PLAN: r0=328(x), r1=158(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x1), r6=83(y1), r7=33(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 158
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 83
LDI r7, 33
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
