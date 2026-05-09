; DESCRIPTION: Composite: Creates a blue circular shape at (115, 104) with radius 12 then Places a purple line segment connecting (25, 62) to (240, 83).
; PLAN: r0=115(x), r1=104(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=62(y1), r7=240(x2), r8=83(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 104
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 62
LDI r7, 240
LDI r8, 83
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
