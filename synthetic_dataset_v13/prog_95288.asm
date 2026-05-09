; DESCRIPTION: Composite: Places a red circle of radius 67 at center (271, 71) then Places a purple line segment connecting (88, 225) to (467, 110).
; PLAN: r0=271(x), r1=71(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x1), r6=225(y1), r7=467(x2), r8=110(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 71
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 225
LDI r7, 467
LDI r8, 110
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
