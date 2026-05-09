; DESCRIPTION: Composite: Places a purple line segment connecting (474, 214) to (12, 54) then Creates a white circular shape at (368, 141) with radius 52.
; PLAN: r0=474(x1), r1=214(y1), r2=12(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=141(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 214
LDI r2, 12
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 141
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
