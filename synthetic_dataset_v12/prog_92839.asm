; DESCRIPTION: Composite: Creates a blue circular shape at (129, 90) with radius 55 then Places a purple line segment connecting (350, 127) to (246, 53).
; PLAN: r0=129(x), r1=90(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=127(y1), r7=246(x2), r8=53(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 90
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 127
LDI r7, 246
LDI r8, 53
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
